import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:taswek/core/helper/on_generate_routs.dart';
import 'package:taswek/core/services/local_storage.dart';
import 'package:taswek/core/utils/app_constant.dart';
import 'package:taswek/core/utils/app_text_style.dart';

class PageViewItem extends StatelessWidget {
  final bool showSkip;
  final String imageBackground, imageFrueit, title, subtitle;

  const PageViewItem({
    super.key,
    required this.imageBackground,
    required this.imageFrueit,
    required this.title,
    required this.subtitle,
    this.showSkip = false,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Stack(
          fit: StackFit.passthrough,
          children: [
            SvgPicture.asset(imageBackground),
            Positioned(
              left: 0,
              right: 0,
              bottom: 0,
              child: SvgPicture.asset(imageFrueit, fit: BoxFit.scaleDown),
            ),
            Visibility(
              visible: showSkip,
              child: PositionedDirectional(
                start: 10,
                top: 10,
                child: InkWell(
                  onTap: () async {
                    Navigator.pushNamedAndRemoveUntil(
                      context,
                      AppRoutes.loginViewRouteName,
                      (route) => false,
                    );
                    await SecureStorage.instance.write(
                      key: AppConstant.onBoardingKey,
                      value: 'true',
                    );
                  },
                  child: Text('تخط', style: AppTextStyles.regular13),
                ),
              ),
            ),
          ],
        ),
        SizedBox(height: 80),
        Text(title, textAlign: TextAlign.center, style: AppTextStyles.bold23),
        Text(
          subtitle,
          textAlign: TextAlign.center,
          style: AppTextStyles.semiBold13,
        ),
        Expanded(child: SizedBox()),
      ],
    );
  }
}
