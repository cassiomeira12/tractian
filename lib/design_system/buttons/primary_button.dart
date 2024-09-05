import 'package:flutter/material.dart';
import 'package:tractian/design_system/design_system.dart';

class PrimaryButton extends StatelessWidget {
  final String? text;
  final Widget? icon;
  final VoidCallback? onPressed;
  final Color? textColor;
  final Color? color;

  const PrimaryButton({
    super.key,
    this.text,
    this.textColor,
    this.icon,
    this.onPressed,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ButtonStyle(
        backgroundColor: WidgetStateProperty.all<Color>(
          onPressed == null
              ? AppColors.secondary
              : color ?? AppColors.secondary,
        ),
        shape: WidgetStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5),
          ),
        ),
      ),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 26, horizontal: 32),
        child: Row(
          children: [
            if (icon != null)
              Padding(
                padding: const EdgeInsets.only(right: 32),
                child: icon,
              ),
            Text(
              text ?? '',
              style: AppTextStyle.button(
                context,
                fontSize: 18,
                color: textColor ?? Theme.of(context).cardColor,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
