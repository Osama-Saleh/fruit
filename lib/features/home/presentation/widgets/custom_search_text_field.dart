import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:taswek/core/app_images/App_images.dart';
import 'package:taswek/core/utils/app_colors.dart';

class CustomSearchTextField extends StatelessWidget {
  final String? hintText;
  final TextEditingController? controller;
  const CustomSearchTextField({
    super.key,
    required this.controller,
    this.hintText,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Color(0x0A000000),
            blurRadius: 9,
            offset: Offset(0, 2),
            spreadRadius: 0,
          ),
        ],
      ),
      child: TextFormField(
        controller: controller,

        decoration: InputDecoration(
          hint: Text(hintText ?? 'Typing...'),
          filled: true,
          fillColor: AppColors.whiteColor,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide(color: Colors.transparent),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide(color: Colors.transparent),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide(color: Colors.transparent),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide(color: Colors.transparent),
          ),
          suffixIcon: SvgPicture.asset(
            AppImages.imagesHomeFilterIcon,
            fit: BoxFit.scaleDown,
          ),
          prefixIcon: SvgPicture.asset(
            AppImages.imagesHomeSearchNormal,
            fit: BoxFit.scaleDown,
          ),
        ),
      ),
    );
  }
}
