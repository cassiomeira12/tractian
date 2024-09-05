import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tractian/data/data.dart';
import 'package:tractian/domain/domain.dart';
import 'package:tractian/infra/infra.dart';
import 'package:tractian/presentation/app_bindings.dart';

import '../../infra/data_sources/location_data_source_mock.dart';

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

    // Get.put<ILocationDataSource>(
    //   LocationDataSource(
    //     http: Get.find(),
    //   ),
    //   permanent: true,
    // );

    Get.put<ILocationDataSource>(
      LocationDataSourceMock(),
      permanent: true,
    );

    Get.put<ILocationRepository>(
      LocationRepository(
        dataSource: Get.find(),
      ),
      permanent: true,
    );

    Get.put<IGetLocationsUseCase>(
      GetLocationsUseCase(
        repository: Get.find(),
      ),
      permanent: true,
    );
  });

  tearDownAll(() {
    Get.deleteAll(force: true);
  });

  test('get location from company successfully', () async {
    var dataSource = Get.find<ICompanyDataSource>();
    var companies = await dataSource.call();
    expect(companies, isNotNull);
    expect(companies, isNotEmpty);

    var company = companies[1];

    var getLocationsUseCase = Get.find<IGetLocationsUseCase>();
    var result = await getLocationsUseCase.call(companyId: company.id);
    expect(result, isNotNull);
    expect(result, isNotEmpty);
  });

  test('get location network error', () async {
    //
  });
}
