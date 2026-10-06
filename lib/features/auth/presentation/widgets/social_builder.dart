import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:taswek/core/utils/app_colors.dart';

class SocialBuilder extends StatelessWidget {
  final void Function()? onTap;
  final String title;
  final String imageName;
  const SocialBuilder({
    super.key,
    required this.onTap,
    required this.title,
    required this.imageName,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: AppColors.grayLight),
        ),
        padding: EdgeInsetsDirectional.only(top: 16, bottom: 16, start: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(imageName),
            Spacer(),
            Text(title),
            Spacer(),
          ],
        ),
      ),
    );
  }
}
