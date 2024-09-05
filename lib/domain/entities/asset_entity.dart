import '../enums/sensor_type_enum.dart';
import '../enums/status_enum.dart';

class AssetEntity {
  final String id;
  final String name;
  final String? parentId;
  final String? locationId;
  final String? sensorId;
  final SensorTypeEnum? sensorType;
  final StatusEnum? status;
  final String? gatewayId;
  final bool isLocation;

  List<AssetEntity> children = [];

  AssetEntity({
    required this.id,
    required this.name,
    required this.parentId,
    this.locationId,
    this.sensorId,
    this.sensorType,
    this.status,
    this.gatewayId,
    this.isLocation = false,
  });

  bool get isRoot => parentId == null;
  bool get isComponent => sensorType != null;

  double point = 0;
  double? greaterPoint;

  int get sortPoint {
    if (isComponent) {
      return children.fold(1, (previous, child) {
        return previous + child.sortPoint;
      });
    }
    if (isLocation) {
      return children.fold(3, (previous, child) {
        return previous + child.sortPoint;
      });
    }
    return children.fold(2, (previous, child) {
      return previous + child.sortPoint;
    });
  }
}
