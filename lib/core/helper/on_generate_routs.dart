import 'package:flutter/material.dart';
import 'package:taswek/features/auth/presentation/view/login_view.dart';
import 'package:taswek/features/auth/presentation/view/sign_up_view.dart';
import 'package:taswek/features/best_selling_fruits/presentation/views/best_selling_view.dart';
import 'package:taswek/features/home/presentation/view/home_view.dart';
import 'package:taswek/features/on_boarding/presentation/view/on_boarding_view.dart';
import 'package:taswek/features/splash_view/splash_view.dart';

class AppRoutes {
  static const String splashRouteName = 'splash';
  static const String onBoardingRouteName = 'onBoardingView';
  static const String loginViewRouteName = 'loginView';
  static const String signUpViewRouteName = 'signUpView';
  static const String bestSellingViewRouteName = 'bestSellingView';

  static const String homeViewRouteName = 'homeView';
  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case splashRouteName:
        return MaterialPageRoute(builder: (context) => const SplashView());
      case onBoardingRouteName:
        return MaterialPageRoute(builder: (context) => const OnBoardingView());
      case loginViewRouteName:
        return MaterialPageRoute(builder: (context) => const LoginView());
      case signUpViewRouteName:
        return MaterialPageRoute(builder: (context) => SignUpView());
      case homeViewRouteName:
        return MaterialPageRoute(builder: (context) => const HomeView());
      case bestSellingViewRouteName:
        return MaterialPageRoute(builder: (context) => const BestSellingView());
      default:
        return MaterialPageRoute(
          builder: (context) => Center(child: Text("page not found")),
        );
    }
  }
}
