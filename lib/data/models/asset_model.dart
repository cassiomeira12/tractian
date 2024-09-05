import 'package:tractian/domain/domain.dart';

class AssetModel extends AssetEntity {
  AssetModel({
    required super.id,
    required super.name,
    required super.parentId,
    required super.locationId,
    required super.sensorId,
    required super.sensorType,
    required super.status,
    required super.gatewayId,
    required super.isLocation,
  });

  factory AssetModel.fromJson(Map<String, dynamic> json) {
    return AssetModel(
      id: json['id'] ?? '',
      name: json['name'] ?? '',
      parentId: json['parentId'],
      locationId: json['locationId'],
      sensorId: json['sensorId'],
      sensorType: SensorTypeEnum.values.where((item) {
        return item.name == json['sensorType'];
      }).firstOrNull,
      status: StatusEnum.values.where((item) {
        return item.name == json['status'];
      }).firstOrNull,
      gatewayId: json['gatewayId'],
      isLocation: json['isLocation'] ?? false,
    );
  }
}
