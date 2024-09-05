import 'package:tractian/design_system/design_system.dart';
import 'package:tractian/domain/domain.dart';

class AssetHelper {
  static AppIcons getTypeIcon(AssetEntity asset) {
    if (asset.isLocation) {
      return AppIcons.location;
    }
    if (asset.isComponent) {
      return AppIcons.component;
    }
    return AppIcons.asset;
  }

  static AppIcon? getStatusIcon(AssetEntity asset) {
    if (asset.status == StatusEnum.alert) {
      return AppIcon(
        AppIcons.alert,
        color: AppColors.danger,
        width: 8,
        height: 8,
      );
    }

    if (SensorTypeEnum.values.contains(asset.sensorType)) {
      return AppIcon(
        AppIcons.energy,
        color: AppColors.green,
        width: 16,
        height: 16,
      );
    }

    return null;
  }
}
