import 'dart:io';
import 'dart:isolate';

import 'package:tractian/domain/domain.dart';

class GetLocationsAssetsUseCase implements IGetLocationsAssetsUseCase {
  final ILocationRepository _locationRepository;
  final IAssetRepository _assetRepository;

  GetLocationsAssetsUseCase({
    required ILocationRepository locationRepository,
    required IAssetRepository assetRepository,
  })  : _locationRepository = locationRepository,
        _assetRepository = assetRepository;

  @override
  Future<List<AssetEntity>> call({
    required String companyId,
    String? search,
    SensorTypeEnum? sensorType,
    StatusEnum? status,
  }) async {
    try {
      List<List<AssetEntity>> result = await Future.wait([
        _locationRepository.call(companyId: companyId),
        _assetRepository.call(companyId: companyId),
      ]);

      List<AssetEntity> locations = result.first;
      List<AssetEntity> assets = result.last;

      List<AssetEntity> composedAssetList = [...locations, ...assets];

      bool runningOnDevice = Platform.isAndroid || Platform.isIOS;

      List<AssetEntity> list = runningOnDevice
          ? await Isolate.run(() {
              // Create another thread to manipulate large data
              return _createAssetsTree(
                composedAssetList,
                search: search,
                sensorType: sensorType,
                status: status,
              );
            })
          // Necessary to run flutter unit test
          : await _createAssetsTree(
              composedAssetList,
              search: search,
              sensorType: sensorType,
              status: status,
            );

      double greaterPoint = runningOnDevice
          ? await Isolate.run(() {
              return _getAssetPointGreater(list);
            })
          : _getAssetPointGreater(list);

      if (list.isNotEmpty) {
        list.first.greaterPoint = greaterPoint;
      }

      return list;
    } catch (error) {
      rethrow;
    }
  }

  static Future<List<AssetEntity>> _createAssetsTree(
    List<AssetEntity> result, {
    String? search,
    SensorTypeEnum? sensorType,
    StatusEnum? status,
  }) async {
    Map<String, AssetEntity> treeAssets = {};
    Map<String, List<AssetEntity>?> children = {};

    for (var item in result) {
      if (item.parentId == null && item.locationId == null) {
        treeAssets[item.id] = item;
      } else if (item.parentId != null) {
        if (children[item.parentId!] == null) {
          children[item.parentId!] = [];
        }
        children[item.parentId!]!.add(item);
      } else if (item.locationId != null) {
        if (children[item.locationId!] == null) {
          children[item.locationId!] = [];
        }
        children[item.locationId!]!.add(item);
      }
    }

    for (var entry in children.entries) {
      if (treeAssets[entry.key] == null) {
        for (var list in children.values) {
          for (var item in list!) {
            if (item.id == entry.key) {
              item.children.clear();
              item.children.addAll(entry.value!);
              break;
            }
          }
        }
      } else {
        for (var child in entry.value!) {
          if (children[child.id] != null) {
            child.children.clear();
            child.children.addAll(children[child.id]!);
          }
        }
        treeAssets[entry.key]!.children.addAll(entry.value!);
      }
    }

    List<AssetEntity> treeListAssets = _filterAssets(
      treeAssets.values.toList(),
      search: search,
      sensorType: sensorType,
      status: status,
    );

    _sortAssets(treeListAssets);

    List<AssetEntity> listAssets = [];

    _convertTreeToList(treeListAssets, listAssets);

    return listAssets;
  }

  static List<AssetEntity> _filterAssets(
    List<AssetEntity> list, {
    String? search,
    SensorTypeEnum? sensorType,
    StatusEnum? status,
  }) {
    if (search != null || sensorType != null || status != null) {
      List<AssetEntity> result = [];
      for (var asset in list) {
        bool find = _findNodeFiltered(
          asset,
          search: search,
          sensorType: sensorType,
          status: status,
        );
        if (find) {
          result.add(asset);
        } else {
          if (search != null && sensorType == null && status == null) {
            find = asset.name.toUpperCase().contains(search.toUpperCase());
            if (find) {
              result.add(asset);
            }
          }
        }
      }
      return result;
    }
    return list;
  }

  static bool _findNodeFiltered(
    AssetEntity root, {
    String? search,
    SensorTypeEnum? sensorType,
    StatusEnum? status,
  }) {
    List<AssetEntity> acceptedChildren = [];

    if (root.children.isNotEmpty) {
      bool findChildren = false;
      for (var child in root.children) {
        bool find = _findNodeFiltered(
          child,
          search: search,
          sensorType: sensorType,
          status: status,
        );

        if (find) {
          acceptedChildren.add(child);
        } else {
          if (search != null && sensorType == null && status == null) {
            find = child.name.toUpperCase().contains(search.toUpperCase());
            if (find) {
              acceptedChildren.add(child);
            }
          }
        }

        findChildren = findChildren || find;
      }
      if (acceptedChildren.isNotEmpty) {
        root.children.clear();
      }
      root.children.addAll(acceptedChildren);
      return findChildren;
    }

    List<bool> resultsToCheck = [];

    if (search != null) {
      bool searchResult =
          root.name.toUpperCase().contains(search.toUpperCase());
      resultsToCheck.add(searchResult);
    }

    if (sensorType != null) {
      bool sensorTypeResult = root.sensorType == sensorType;
      resultsToCheck.add(sensorTypeResult);
    }

    if (status != null) {
      bool statusResult = root.status == status;
      resultsToCheck.add(statusResult);
    }

    return resultsToCheck.fold(
        true, (previous, current) => previous && current);
  }

  static void _sortAssets(List<AssetEntity> children) {
    children.sort((a, b) {
      return b.sortPoint.compareTo(a.sortPoint);
    });
    for (var child in children) {
      if (child.children.isNotEmpty) {
        _sortAssets(child.children);
      }
    }
  }

  static void _convertTreeToList(
    List<AssetEntity> children,
    List<AssetEntity> result, {
    double point = 0,
  }) {
    for (var item in children) {
      item.point += point;
      result.add(item);
      if (item.children.isNotEmpty) {
        _convertTreeToList(item.children, result, point: item.point + 1);
      }
    }
  }

  static double _getAssetPointGreater(List<AssetEntity> list) {
    double greater = 0;
    for (var asset in list) {
      if (asset.point >= greater) {
        greater = asset.point;
      }
    }
    return greater;
  }
}
