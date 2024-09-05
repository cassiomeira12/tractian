import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tractian/data/data.dart';
import 'package:tractian/domain/domain.dart';
import 'package:tractian/infra/infra.dart';
import 'package:tractian/presentation/app_bindings.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences.setMockInitialValues({});

  setUpAll(() async {
    AppBindings().dependencies();

    Get.put<ICompanyDataSource>(
      CompanyDataSource(http: Get.find()),
      permanent: true,
    );
    Get.put<ICompanyDataSource>(
      CompanyDataSource(http: Get.find()),
      permanent: true,
    );
    Get.put<ICompanyRepository>(
      CompanyRepository(dataSource: Get.find()),
      permanent: true,
    );
    Get.put<IGetCompaniesUseCase>(
      GetCompaniesUseCase(repository: Get.find()),
      permanent: true,
    );

    Get.put<ILocationDataSource>(
      LocationDataSource(
        http: Get.find(),
      ),
      permanent: true,
    );
    Get.put<ILocationRepository>(
      LocationRepository(
        dataSource: Get.find(),
      ),
      permanent: true,
    );

    Get.put<IAssetDataSource>(
      AssetDataSource(http: Get.find()),
      permanent: true,
    );
    Get.put<IAssetRepository>(
      AssetRepository(dataSource: Get.find()),
      permanent: true,
    );

    Get.put<IGetLocationsAssetsUseCase>(
      GetLocationsAssetsUseCase(
        locationRepository: Get.find(),
        assetRepository: Get.find(),
      ),
      permanent: true,
    );
  });

  tearDownAll(() {
    Get.deleteAll(force: true);
  });

  test('get locations and assets from company successfully', () async {
    var getCompaniesUseCase = Get.find<IGetCompaniesUseCase>();
    var companies = await getCompaniesUseCase.call();
    expect(companies, isNotNull);
    expect(companies, isNotEmpty);

    var company = companies[2];

    var getLocationsAssetsUseCase = Get.find<IGetLocationsAssetsUseCase>();
    var result = await getLocationsAssetsUseCase.call(companyId: company.id);
    expect(result, isNotNull);
    expect(result, isNotEmpty);
  });
}
