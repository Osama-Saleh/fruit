import 'package:flutter/material.dart';
import 'package:taswek/core/widgets/custom_app_bar.dart';
import 'package:taswek/features/auth/presentation/widgets/login_view_body.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'تسجيل دخول',),
      body: LoginViewBody(),
    );
  }
}

