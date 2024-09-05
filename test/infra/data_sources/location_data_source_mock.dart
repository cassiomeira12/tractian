import 'package:tractian/data/data.dart';

class LocationDataSourceMock implements ILocationDataSource {
  final bool throwError;

  LocationDataSourceMock({this.throwError = false});

  @override
  Future<List<AssetModel>> call({required String companyId}) async {
    List<Map<String, dynamic>> data = [
      {
        "id": "656a07b3f2d4a1001e2144bf",
        "name": "CHARCOAL STORAGE SECTOR",
        "parentId": "65674204664c41001e91ecb4"
      },
      {
        "id": "656733611f4664001f295dd0",
        "name": "Empty Machine house",
        "parentId": null
      },
      {
        "id": "656733b1664c41001e91d9ed",
        "name": "Machinery house",
        "parentId": null
      },
      {
        "id": "65674204664c41001e91ecb4",
        "name": "PRODUCTION AREA - RAW MATERIAL",
        "parentId": null
      },
    ];

    if (throwError) {
      throw Exception();
    }

    return List.from(data).map((json) {
      return AssetModel.fromJson(json);
    }).toList();
  }
}
