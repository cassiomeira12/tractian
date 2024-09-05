import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tractian/domain/domain.dart';
import 'package:tractian/presentation/app_bindings.dart';
import 'package:tractian/presentation/assets/assets_bindings.dart';
import 'package:tractian/presentation/assets/assets_controller.dart';
import 'package:tractian/presentation/menu/menu_bindings.dart';
import 'package:tractian/presentation/stores/company_store.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences.setMockInitialValues({});

  setUpAll(() {
    AppBindings().dependencies();

    MenuBindings().dependencies();

    AssetsBindings().dependencies();
  });

  tearDownAll(() {
    Get.deleteAll(force: true);
  });

  test('test loading assets successfully', () async {
    var getCompaniesUseCase = Get.find<IGetCompaniesUseCase>();
    var companies = await getCompaniesUseCase.call();
    expect(companies, isNotNull);
    expect(companies, isNotEmpty);

    var companyStore = Get.find<CompanyStore>();
    companyStore.companySelected = companies[1];

    var controller = Get.find<AssetsController>();
    while (controller.isLoading.value) {
      await Future.delayed(const Duration(seconds: 1));
    }
    expect(controller.list, isNotEmpty);
  });
}
