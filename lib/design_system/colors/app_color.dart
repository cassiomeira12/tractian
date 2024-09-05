import 'package:flutter/material.dart';

class AppColor extends Color {
  AppColor(super.value);
}

abstract class AppColors {
  static AppColor primary = AppColor(0xFF17192D);
  static AppColor secondary = AppColor(0xFF2188FF);

  static AppColor transparent = AppColor(0x00000000);

  static AppColor background = AppColor(0xFFFFFFFF);
  static AppColor divider = AppColor(0xFFEAEEF2);
  static AppColor green = AppColor(0xFF52C41A);

  // Alerts Colors
  static AppColor success = AppColor(0xFF28A777);
  static AppColor danger = AppColor(0xFFED3833);
  static AppColor warning = AppColor(0xFFFFC107);

  // Neutral Colors
  static AppColor black = AppColor(0x0ff00000);
  static AppColor dark = AppColor(0xFF343A40);
  static AppColor muted = AppColor(0xFF757D6C);
  static AppColor grey = AppColor(0xFFd3d1cb);
  static AppColor light = AppColor(0xFFedeef3);
  static AppColor white = AppColor(0xFFffffff);
  static AppColor neutral = AppColor(0xFFD8DFE6);
  static AppColor neutralGray = AppColor(0xFFEAEFF3);
  static AppColor neutralDark = AppColor(0xFF77818C);
}
