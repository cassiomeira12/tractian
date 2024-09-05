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
  });

  tearDownAll(() {
    Get.deleteAll(force: true);
  });

  test('get companies successfully', () async {
    var dataSource = Get.find<ICompanyDataSource>();
    var result = await dataSource.call();
    expect(result, isNotNull);
    expect(result, isNotEmpty);
  });

  test('get companies network error', () async {
    //
  });
}
