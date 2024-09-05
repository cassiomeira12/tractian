import 'package:get/get.dart';
import 'package:tractian/domain/domain.dart';
import 'package:tractian/presentation/app_router.dart';

import '../stores/company_store.dart';

class MenuController extends GetxController {
  final IGetCompaniesUseCase _getCompaniesUseCase;
  final CompanyStore _companyStore;

  MenuController({
    required IGetCompaniesUseCase getCompaniesUseCase,
    required CompanyStore companyStore,
  })  : _getCompaniesUseCase = getCompaniesUseCase,
        _companyStore = companyStore;

  RxBool isLoading = RxBool(true);
  RxString errorMessage = RxString('');
  RxList<CompanyEntity> companies = RxList.empty();

  @override
  void onInit() {
    super.onInit();
    _getCompanies();
  }

  Future<void> _getCompanies() async {
    try {
      isLoading.value = true;
      errorMessage.value = '';
      List<CompanyEntity> result = await _getCompaniesUseCase.call();
      companies.addAll(result);
    } catch (error) {
      errorMessage.value = 'error_loading_companies'.tr;
    } finally {
      isLoading.value = false;
    }
  }

  void tryAgain() => _getCompanies();

  void selectCompany(CompanyEntity company) {
    _companyStore.companySelected = company;
    Get.toNamed(AppRouter.asset.route);
  }
}
