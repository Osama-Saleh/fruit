import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:taswek/core/app_images/App_images.dart';
import 'package:taswek/core/helper/on_generate_routs.dart';
import 'package:taswek/core/helper/show_message.dart';
import 'package:taswek/core/services/local_storage.dart';
import 'package:taswek/core/utils/get_it.dart';
import 'package:taswek/core/widgets/custom_botton.dart';
import 'package:taswek/core/widgets/custom_text_form_field.dart';
import 'package:taswek/features/auth/domain/repos/auth_repo.dart';
import 'package:taswek/features/auth/presentation/cubit/log_in/log_in_cubit.dart';
import 'package:taswek/features/auth/presentation/cubit/log_in/log_in_state.dart';
import 'package:taswek/features/auth/presentation/widgets/social_builder.dart';

class LoginViewBody extends StatelessWidget {
  LoginViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: BlocProvider<LogInCubit>(
          create: (context) => LogInCubit(authRepo: getIt<AuthRepo>()),
          child: Builder(
            builder: (context) {
              final cubit = context.read<LogInCubit>();
              return Column(
                spacing: 12,
                children: [
                  CustomTextFormField(
                    controller: cubit.mailController,
                    hintText: 'البريد الإلكتروني',
                  ),
                  BlocBuilder<LogInCubit, LogInState>(
                    builder: (context, state) {
                      return CustomTextFormField(
                        controller: cubit.passController,
                        hintText: 'كلمة المرور',
                        obscureText: !cubit.isShowPassword,
                        suffixIcon: InkWell(
                          onTap: cubit.showPassword,
                          child: Icon(
                            cubit.isShowPassword
                                ? Icons.visibility
                                : Icons.visibility_off,
                          ),
                        ),
                      );
                    },
                  ),

                  Align(
                    alignment: AlignmentGeometry.centerEnd,
                    child: Text('نسيت كلمة المرور؟'),
                  ),
                  SizedBox(
                    width: MediaQuery.sizeOf(context).width,
                    child: BlocConsumer<LogInCubit, LogInState>(
                      listener: (context, state) {
                        if (state is LogInSuccess) {
                          Navigator.of(context).pushNamedAndRemoveUntil(
                            AppRoutes.homeViewRouteName,
                            (route) => false,
                          );
                          ShowMessage.showSnackBar(
                            context,
                            'تم تسجيل الدخول بنجاح',
                          );
                          SecureStorage.instance.write(
                            key: 'isUserLoggedIn',
                            value: 'true',
                          );
                        }
                        if (state is LogInFailure) {
                          ShowMessage.showSnackBar(context, state.errorMessage);
                        }
                      },
                      builder: (context, state) {
                        return CustomButton(
                          onPressed: () {
                            cubit.loginWithmailAndPassword(
                              email: cubit.mailController.text,
                              password: cubit.passController.text,
                            );
                          },
                          text: state is LogInLoading
                              ? 'جاري تسجيل الدخول....'
                              : 'تسجيل دخول',
                        );
                      },
                    ),
                  ),
                  SizedBox(height: 12),
                  InkWell(
                    onTap: () {
                      Navigator.pushNamed(
                        context,
                        AppRoutes.signUpViewRouteName,
                      );
                    },
                    child: Text('لا تمتلك حساب؟ قم بإنشاء حساب'),
                  ),
                  SizedBox(height: 8),
                  Row(
                    children: [
                      Expanded(child: Divider()),
                      Text('\t\t\t\tأو\t\t\t\t'),
                      Expanded(child: Divider()),
                    ],
                  ),
                  SizedBox(height: 12),

                  SocialBuilder(
                    onTap: () {},
                    title: 'تسجيل بواسطة جوجل',
                    imageName: AppImages.imagesAuthGoogle,
                  ),
                  SocialBuilder(
                    onTap: () {},
                    title: 'تسجيل بواسطة أبل',
                    imageName: AppImages.imagesAuthApple,
                  ),
                  SocialBuilder(
                    onTap: () {},
                    title: 'تسجيل بواسطة فيسبوك',
                    imageName: AppImages.imagesAuthFacebook,
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
