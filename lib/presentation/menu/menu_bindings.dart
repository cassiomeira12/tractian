import 'package:get/get.dart';
import 'package:tractian/data/data.dart';
import 'package:tractian/domain/domain.dart';
import 'package:tractian/infra/infra.dart';

import '../stores/company_store.dart';
import 'menu_controller.dart';

class MenuBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ICompanyDataSource>(
      () => CompanyDataSource(
        http: Get.find(),
      ),
      fenix: true,
    );
    Get.lazyPut<ICompanyRepository>(
      () => CompanyRepository(
        dataSource: Get.find(),
      ),
      fenix: true,
    );
    Get.lazyPut<IGetCompaniesUseCase>(
      () => GetCompaniesUseCase(
        repository: Get.find(),
      ),
      fenix: true,
    );

    Get.put<CompanyStore>(
      CompanyStore(),
      permanent: true,
    );

    Get.lazyPut<MenuController>(
      () => MenuController(
        getCompaniesUseCase: Get.find(),
        companyStore: Get.find(),
      ),
      fenix: true,
    );
  }
}
