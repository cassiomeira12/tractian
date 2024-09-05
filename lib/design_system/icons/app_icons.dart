// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../assets/app_assets.dart';
import '../colors/app_color.dart';

class AppIcon extends StatelessWidget {
  final AppIcons icon;
  final AppColor? color;
  final double height;
  final double width;

  const AppIcon(
    this.icon, {
    super.key,
    this.color,
    this.height = 24,
    this.width = 24,
  });

  @override
  Widget build(BuildContext context) {
    if (icon.value.contains('.svg')) {
      return SvgPicture.asset(
        icon.value,
        color: color,
        width: width,
        height: height,
      );
    }
    if (icon.value.contains('.png')) {
      return Image.asset(
        icon.value,
        color: color,
        width: width,
        height: height,
      );
    }
    return const SizedBox.shrink();
  }
}

class AppIcons {
  final String value;

  const AppIcons(this.value);

  static AppIcons tractianLogo = const AppIcons(AppAssets.logo);
  static AppIcons company = const AppIcons(AppAssets.company);
  static AppIcons back = const AppIcons(AppAssets.back);

  static AppIcons location = const AppIcons(AppAssets.location);
  static AppIcons asset = const AppIcons(AppAssets.asset);
  static AppIcons component = const AppIcons(AppAssets.component);

  static AppIcons bolt = const AppIcons(AppAssets.bolt);
  static AppIcons energy = const AppIcons(AppAssets.boltFill);
  static AppIcons info = const AppIcons(AppAssets.info);
  static AppIcons search = const AppIcons(AppAssets.search);
  static AppIcons arrowDown = const AppIcons(AppAssets.switcher);
  static AppIcons alert = const AppIcons(AppAssets.dot);
}
