import 'package:flutter/material.dart';
import 'package:tractian/design_system/design_system.dart';

// ignore: must_be_immutable
class SecondaryButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;
  bool? fullWidth;
  AppColor? borderColor;
  AppColor? backgroundColor;
  TextStyle? style;
  AppColor? textColor;
  AppIcons? icon;
  AppColor? iconColor;

  SecondaryButton({
    super.key,
    required this.text,
    this.onPressed,
    this.fullWidth = true,
    this.borderColor,
    this.backgroundColor,
    this.style,
    this.textColor,
    this.icon,
    this.iconColor,
  });

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: onPressed,
      style: OutlinedButton.styleFrom(
        backgroundColor: backgroundColor,
        side: BorderSide(
          color: borderColor ?? AppColors.neutral,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5),
        ),
      ),
      child: Row(
        children: [
          if (icon != null)
            Padding(
              padding: const EdgeInsets.only(right: 8),
              child: AppIcon(
                icon!,
                width: 16,
                height: 16,
                color: iconColor ?? AppColors.neutralDark,
              ),
            ),
          Text(
            text,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: AppTextStyle.button(
              context,
              color: textColor,
            ),
          ),
        ],
      ),
    );
  }
}
