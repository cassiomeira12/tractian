import 'package:flutter/widgets.dart';
import 'package:tractian/design_system/design_system.dart';
import 'package:tractian/domain/domain.dart';
import 'package:tractian/presentation/helpers/asset_helper.dart';

class NodeTreeWidget extends StatelessWidget {
  final AssetEntity asset;

  const NodeTreeWidget({
    super.key,
    required this.asset,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        top: 5,
        left: 24.0 * asset.point,
      ),
      margin: const EdgeInsets.only(left: 10),
      child: Row(
        children: [
          if (asset.children.isNotEmpty || (24.0 * asset.point) > 0)
            AppIcon(
              AppIcons.arrowDown,
              color: asset.children.isEmpty
                  ? AppColors.transparent
                  : AppColors.primary,
            ),
          Padding(
            padding: const EdgeInsets.only(right: 6),
            child: AppIcon(
              AssetHelper.getTypeIcon(asset),
              color: AppColors.secondary,
            ),
          ),
          Flexible(
            child: Text(
              asset.name,
              style: AppTextStyle.subtitle(
                context,
                color: AppColors.primary,
              ),
              overflow: TextOverflow.ellipsis,
            ),
          ),
          if (AssetHelper.getStatusIcon(asset) != null)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 6),
              child: AssetHelper.getStatusIcon(asset),
            ),
        ],
      ),
    );
  }
}
