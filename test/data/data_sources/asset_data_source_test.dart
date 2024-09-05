import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tractian/data/data.dart';
import 'package:tractian/infra/infra.dart';
import 'package:tractian/presentation/app_bindings.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences.setMockInitialValues({});

  setUpAll(() {
    AppBindings().dependencies();

    Get.put<ICompanyDataSource>(
      CompanyDataSource(
        http: Get.find(),
      ),
      permanent: true,
    );

    Get.put<IAssetDataSource>(
      AssetDataSource(
        http: Get.find(),
      ),
      permanent: true,
    );
  });

  tearDownAll(() {
    Get.deleteAll(force: true);
  });

  test('get assets successfully', () async {
    var dataSource = Get.find<ICompanyDataSource>();
    var companies = await dataSource.call();
    expect(companies, isNotNull);
    expect(companies, isNotEmpty);

    for (var company in companies) {
      var dataSource = Get.find<IAssetDataSource>();
      var result = await dataSource.call(companyId: company.id);
      expect(result, isNotNull);
    }
  });

  test('get assets network error', () async {
    //
  });
}
