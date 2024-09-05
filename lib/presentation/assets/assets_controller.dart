import 'package:get/get.dart';
import 'package:tractian/domain/domain.dart';

import '../stores/company_store.dart';

class AssetsController extends GetxController {
  final IGetLocationsAssetsUseCase _getLocationsAssetsUseCase;
  final CompanyStore _companyStore;

  AssetsController({
    required IGetLocationsAssetsUseCase getLocationsAssetsUseCase,
    required CompanyStore companyStore,
  })  : _getLocationsAssetsUseCase = getLocationsAssetsUseCase,
        _companyStore = companyStore;

  RxBool isLoading = RxBool(true);
  RxString errorMessage = RxString('');
  RxList<AssetEntity> list = RxList.empty();

  double get additionalWidth {
    return list.isEmpty ? 0 : list.first.greaterPoint!;
  }

  String? _searchText;
  SensorTypeEnum? _sensorTypeEnum;
  StatusEnum? _statusEnum;

  @override
  void onInit() {
    super.onInit();
    _getLocationsAssets();
  }

  Future<void> _getLocationsAssets() async {
    try {
      isLoading.value = true;
      errorMessage.value = '';
      list.clear();
      String companyId = _companyStore.companySelected!.id;
      List<AssetEntity> result = await _getLocationsAssetsUseCase.call(
        companyId: companyId,
        search: _searchText,
        sensorType: _sensorTypeEnum,
        status: _statusEnum,
      );
      list.addAll(result);
    } catch (error) {
      errorMessage.value = 'error_loading_assets'.tr;
    } finally {
      isLoading.value = false;
    }
  }

  void tryAgain() => _getLocationsAssets();

  void backPage() {
    Get.back();
  }

  void onSearch(String search) {
    _searchText = search.isEmpty ? null : search;
    _getLocationsAssets();
  }

  void filterOnlyEnergySensor(bool enable) {
    _sensorTypeEnum = enable ? SensorTypeEnum.energy : null;
    _getLocationsAssets();
  }

  void filterOnlyAlertStatus(bool enable) {
    _statusEnum = enable ? StatusEnum.alert : null;
    _getLocationsAssets();
  }
}
