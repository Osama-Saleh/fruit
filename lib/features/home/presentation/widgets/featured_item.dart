import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:taswek/core/app_images/App_images.dart';
import 'package:taswek/core/utils/app_colors.dart';
import 'package:taswek/core/utils/app_text_style.dart';
import 'package:taswek/core/widgets/custom_botton.dart';

class FeaturedItem extends StatelessWidget {
  const FeaturedItem({super.key});

  @override
  Widget build(BuildContext context) {
    double itemWidth = MediaQuery.of(context).size.width - 32;
    return SizedBox(
      height: itemWidth * (158 / 342),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: List.generate(2, (index) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: SizedBox(
                width: itemWidth,
                child: AspectRatio(
                  aspectRatio: 342 / 158,
                  child: Stack(
                    children: [
                      Positioned(
                        left: 0,
                        right: itemWidth * 0.4,
                        top: 0,
                        bottom: 0,
                        child: SvgPicture.asset(
                          AppImages.imagesOnboardingOnBoardingFruit2,
                          fit: BoxFit.fill,
                        ),
                      ),
                      Container(
                        width: itemWidth * 0.5,
                        clipBehavior: Clip.antiAlias,

                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage(
                              AppImages.imagesHomeBackgroundGreen,
                            ),
                          ),
                          borderRadius: BorderRadiusDirectional.circular(8),
                        ),
                        padding: EdgeInsetsDirectional.only(start: 25),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(height: 24),
                            Text(
                              'عروض العيد',
                              style: AppTextStyles.regular13.copyWith(
                                color: AppColors.whiteColor,
                              ),
                            ),
                            Spacer(),
                            Text(
                              'خصم 25%',
                              style: AppTextStyles.bold19.copyWith(
                                color: AppColors.whiteColor,
                              ),
                            ),
                            SizedBox(height: 8),
                            Container(
                              width: itemWidth,
                              padding: EdgeInsetsDirectional.only(end: 30),
                              child: CustomButton(
                                onPressed: () {},
                                text: 'تسوق الان',
                                textStyle: AppTextStyles.bold13.copyWith(
                                  color: AppColors.primaryColor,
                                ),
                                color: AppColors.whiteColor,
                              ),
                            ),
                            SizedBox(height: 12),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          }),
        ),
      ),
    );
  }
}
