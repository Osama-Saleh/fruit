import 'package:flutter/material.dart';
import 'package:taswek/core/utils/app_colors.dart';

class CustomTextFormField extends StatelessWidget {
  final String? hintText;
  final Widget? suffixIcon;
  final TextEditingController? controller;
  final bool obscureText;
  const CustomTextFormField({
    super.key,
    required this.controller,
    this.hintText,
    this.suffixIcon,
    this.obscureText = false,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: obscureText,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'هذا الحقل مطلوب';
        }
        return null;
      },
      decoration: InputDecoration(
        hint: Text(hintText ?? 'Typing...'),
        filled: true,
        fillColor: AppColors.backgroundColorTextFiled,
        suffixIcon: suffixIcon,

        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: AppColors.grayLight),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: AppColors.redLight),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: AppColors.grayLight),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: AppColors.redLight),
        ),
      ),
    );
  }
}
