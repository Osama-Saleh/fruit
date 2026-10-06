import 'package:flutter/material.dart';
import 'package:taswek/core/utils/app_colors.dart';

enum ButtonType { elevated, outlined, text }

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;
  final ButtonType type;
  final Color? color;
  final TextStyle? textStyle;
  const CustomButton({
    super.key,
    required this.onPressed,
    required this.text,
    this.type = ButtonType.elevated,
    this.color,
    this.textStyle,
  });

  @override
  Widget build(BuildContext context) {
    final buttonColor = color ?? AppColors.primaryColor;

    switch (type) {
      case ButtonType.elevated:
        return ElevatedButton(
          onPressed: onPressed,
          style: ElevatedButton.styleFrom(
            backgroundColor: buttonColor,
            foregroundColor: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadiusGeometry.circular(12),
            ),
          ),
          child: Text(text,style: textStyle ,),
        );

      case ButtonType.outlined:
        return OutlinedButton(
          onPressed: onPressed,
          style: OutlinedButton.styleFrom(
            foregroundColor: buttonColor,
            side: BorderSide(color: buttonColor),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadiusGeometry.circular(12),
            ),
          ),
          child: Text(text,style: textStyle ,),
        );

      case ButtonType.text:
        return TextButton(
          onPressed: onPressed,
          style: TextButton.styleFrom(foregroundColor: buttonColor),
          child: Text(text,style: textStyle ,),
        );
    }
  }
}
