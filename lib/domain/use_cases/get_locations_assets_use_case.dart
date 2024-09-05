import 'package:tractian/domain/domain.dart';

abstract class IGetLocationsAssetsUseCase {
  Future<List<AssetEntity>> call({
    required String companyId,
    String? search,
    SensorTypeEnum? sensorType,
    StatusEnum? status,
  });
}
