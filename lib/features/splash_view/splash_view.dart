import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:taswek/core/app_images/App_images.dart';
import 'package:taswek/core/helper/on_generate_routs.dart';
import 'package:taswek/core/services/local_storage.dart';
import 'package:taswek/core/utils/app_constant.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 5), () async {
      bool onBoardingFinished =
          await SecureStorage.instance.read(key: AppConstant.onBoardingKey) ==
          'true';
      bool userLoggedIn =
          await SecureStorage.instance.read(key: 'isUserLoggedIn') == 'true';
      Navigator.pushNamedAndRemoveUntil(
        context,
        onBoardingFinished
            ? userLoggedIn
                  ? AppRoutes.homeViewRouteName
                  : AppRoutes.loginViewRouteName
            : AppRoutes.onBoardingRouteName,
        (route) => false,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column( 
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Align(
            alignment: Alignment.topLeft,
            child: SvgPicture.asset(AppImages.imagesSplashTree),
          ),
          // Expanded(child: SizedBox()),
          SvgPicture.asset(AppImages.imagesSplashLogo, fit: BoxFit.scaleDown),
          // Expanded(child: SizedBox()),
          SvgPicture.asset(AppImages.imagesSplashCircles, fit: BoxFit.fill),
        ],
      ),
    );
  }
}
