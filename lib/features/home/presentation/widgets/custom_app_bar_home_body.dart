import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:taswek/core/app_images/App_images.dart';
import 'package:taswek/core/helper/get_user.dart';
import 'package:taswek/core/utils/app_colors.dart';
import 'package:taswek/core/utils/app_text_style.dart';

class CustomAppBarHomeBody extends StatelessWidget {
  const CustomAppBarHomeBody({super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Image.asset(AppImages.imagesHomeProfileImage),
      title: Text(
        'صباح الخير !..',
        style: AppTextStyles.regular16.copyWith(color: Colors.grey.shade500),
      ),
      subtitle: Text(
        getUser().name,
        style: AppTextStyles.bold16.copyWith(color: Colors.black),
      ),
      trailing: Column(
        children: [
          CircleAvatar(
            radius: 22,
            backgroundColor: AppColors.lightGreen,
            child: SvgPicture.asset(AppImages.imagesHomeNotification),
          ),
        ],
      ),
    );
  }
}
