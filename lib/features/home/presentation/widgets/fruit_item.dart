import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:taswek/core/app_images/App_images.dart';
import 'package:taswek/core/utils/app_colors.dart';
import 'package:taswek/core/utils/app_text_style.dart';

class FruitItem extends StatelessWidget {
  const FruitItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.grayLight,

      child: Stack(
        children: [
          IconButton(onPressed: () {}, icon: Icon(Icons.favorite_border)),
          Positioned(
            left: 0,
            right: 0,
            child: SvgPicture.asset(
              AppImages.imagesOnboardingOnBoardingFruit2,
              fit: BoxFit.scaleDown,
              width: 200,
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Padding(
              padding: EdgeInsets.all(8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      Text('أناناس', style: AppTextStyles.semiBold13),
                      Text('20جنية / الكيلو'),
                    ],
                  ),
                  Spacer(),
                  CircleAvatar(radius: 20, child: Icon(Icons.add)),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
