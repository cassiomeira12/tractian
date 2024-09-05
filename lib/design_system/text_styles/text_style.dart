import 'package:flutter/material.dart';

import '../colors/app_color.dart';

class AppTextStyle extends TextStyle {
  AppTextStyle.title(
    BuildContext context, {
    double fontSize = 24,
    AppColor? color,
    super.overflow,
  }) : super(
          // fontFamily: '',
          fontSize: fontSize,
          color: color ?? AppColors.dark,
          fontWeight: FontWeight.w700,
        );

  AppTextStyle.subtitle(
    BuildContext context, {
    double fontSize = 16,
    Color? color,
    super.overflow,
    bool bold = false,
  }) : super(
          // fontFamily: '',
          fontSize: fontSize,
          color: color ?? AppColors.dark,
          fontWeight: bold ? FontWeight.bold : FontWeight.w400,
        );

  AppTextStyle.message(
    BuildContext context, {
    double fontSize = 12,
    Color? color,
    super.overflow,
    bool bold = false,
  }) : super(
          // fontFamily: '',
          fontSize: fontSize,
          color: color ?? AppColors.dark,
          fontWeight: bold ? FontWeight.bold : FontWeight.w400,
        );

  AppTextStyle.label(
    BuildContext context, {
    double fontSize = 10,
    Color? color,
    super.overflow,
  }) : super(
          // fontFamily: '',
          fontSize: fontSize,
          color: color ?? AppColors.dark,
          fontWeight: FontWeight.w500,
        );

  AppTextStyle.field(
    BuildContext context, {
    double fontSize = 16,
    Color? color,
    super.overflow,
  }) : super(
          // fontFamily: '',
          fontSize: fontSize,
          color: color ?? AppColors.dark,
          fontWeight: FontWeight.w400,
        );

  AppTextStyle.button(
    BuildContext context, {
    double fontSize = 14,
    Color? color,
    super.overflow,
    bool bold = false,
  }) : super(
          // fontFamily: '',
          fontSize: fontSize,
          color: color ?? AppColors.dark,
          fontWeight: bold ? FontWeight.bold : FontWeight.w400,
        );

  AppTextStyle.hyperlink(
    BuildContext context, {
    double fontSize = 14,
    Color? color,
    super.overflow,
  }) : super(
          // fontFamily: '',
          fontSize: fontSize,
          color: color ?? AppColors.dark,
          fontWeight: FontWeight.w400,
          decoration: TextDecoration.underline,
        );

  AppTextStyle.footnote(
    BuildContext context, {
    double fontSize = 12,
    Color? color,
    super.overflow,
  }) : super(
          // fontFamily: '',
          fontSize: fontSize,
          color: color ?? AppColors.dark,
          fontWeight: FontWeight.w400,
        );
}
