import 'package:get/get.dart';
import 'package:tractian/data/data.dart';
import 'package:tractian/domain/repositories/asset_repository.dart';
import 'package:tractian/domain/repositories/location_repository.dart';
import 'package:tractian/domain/use_cases/get_locations_assets_use_case.dart';
import 'package:tractian/infra/infra.dart';

import 'assets_controller.dart';

class AssetsBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ILocationDataSource>(
      () => LocationDataSource(
        http: Get.find(),
      ),
      fenix: true,
    );
    Get.lazyPut<ILocationRepository>(
      () => LocationRepository(
        dataSource: Get.find(),
      ),
      fenix: true,
    );

    Get.lazyPut<IAssetDataSource>(
      () => AssetDataSource(
        http: Get.find(),
      ),
      fenix: true,
    );
    Get.lazyPut<IAssetRepository>(
      () => AssetRepository(
        dataSource: Get.find(),
      ),
      fenix: true,
    );

    Get.lazyPut<IGetLocationsAssetsUseCase>(
      () => GetLocationsAssetsUseCase(
        assetRepository: Get.find(),
        locationRepository: Get.find(),
      ),
      fenix: true,
    );

    Get.lazyPut<AssetsController>(
      () => AssetsController(
        getLocationsAssetsUseCase: Get.find(),
        companyStore: Get.find(),
      ),
      fenix: true,
    );
  }
}
