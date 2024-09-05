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

  setUpAll(() async {
    AppBindings().dependencies();

    Get.put<ICompanyDataSource>(
      CompanyDataSource(
        http: Get.find(),
      ),
      permanent: true,
    );

    Get.put<ILocationDataSource>(
      LocationDataSource(
        http: Get.find(),
      ),
      permanent: true,
    );
  });

  tearDownAll(() {
    Get.deleteAll(force: true);
  });

  test('get location successfully', () async {
    var dataSource = Get.find<ICompanyDataSource>();
    var companies = await dataSource.call();
    expect(companies, isNotNull);
    expect(companies, isNotEmpty);

    for (var company in companies) {
      var dataSource = Get.find<ILocationDataSource>();
      var result = await dataSource.call(companyId: company.id);
      expect(result, isNotNull);
    }
  });

  test('get location network error', () async {
    //
  });
}
