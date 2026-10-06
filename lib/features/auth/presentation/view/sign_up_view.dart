import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:taswek/core/helper/on_generate_routs.dart';
import 'package:taswek/core/helper/show_message.dart';
import 'package:taswek/core/utils/get_it.dart';
import 'package:taswek/core/widgets/custom_app_bar.dart';
import 'package:taswek/core/widgets/custom_botton.dart';
import 'package:taswek/core/widgets/custom_text_form_field.dart';
import 'package:taswek/features/auth/domain/repos/auth_repo.dart';
import 'package:taswek/features/auth/presentation/cubit/sign_up/sign_up_cubit.dart';
import 'package:taswek/features/auth/presentation/cubit/sign_up/sign_up_state.dart';
import 'package:taswek/features/auth/presentation/widgets/terms_and_conditions_widget.dart';

class SignUpView extends StatelessWidget {
  SignUpView({super.key});
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'حساب جديد', showArroBack: true),
      body: SafeArea(
        child: Form(
          key: formKey,
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsetsDirectional.symmetric(
                horizontal: 16,
                vertical: 16,
              ),
              child: BlocProvider<SignUpCubit>(
                create: (context) => SignUpCubit(getIt<AuthRepo>()),

                child: Builder(
                  builder: (context) {
                    final cubit = context.read<SignUpCubit>();
                    return Column(
                      spacing: 12,
                      children: [
                        CustomTextFormField(
                          controller: cubit.nameController,
                          hintText: 'الاسم كامل',
                        ),
                        CustomTextFormField(
                          controller: cubit.mailSignUpController,
                          hintText: 'البريد الإلكتروني',
                        ),
                        BlocBuilder<SignUpCubit, SignUpState>(
                          builder: (context, state) {
                            return CustomTextFormField(
                              controller: cubit.passSignupController,
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

                        const TermsAndConditionsWidget(),
                        BlocConsumer<SignUpCubit, SignUpState>(
                          listener: (context, state) {
                            if (state is SignUpSuccess) {
                              Navigator.pop(context);
                              ShowMessage.showSnackBar(
                                context,
                                'تم إنشاء الحساب بنجاح',
                              );
                            }

                            if (state is SignUpFailure) {
                              ShowMessage.showSnackBar(
                                context,
                                state.errorMessage,
                              );
                            }
                          },
                          builder: (context, state) {
                            return SizedBox(
                              width: double.infinity,
                              child: CustomButton(
                                onPressed: state is SignUpLoading
                                    ? () {}
                                    : () async {
                                        if (!cubit.isAccepted) {
                                          ShowMessage.showSnackBar(
                                            context,
                                            'يجب قبول الشروط والأحكام',
                                          );
                                          return;
                                        }
                                        if (formKey.currentState!.validate()) {
                                          await cubit
                                              .createUserWithmailAndPassword(
                                                cubit.nameController.text,
                                                cubit.mailSignUpController.text,
                                                cubit.passSignupController.text,
                                              );
                                        }
                                      },
                                text: state is SignUpLoading
                                    ? 'جاري التحميل...'
                                    : 'إنشاء حساب جديد',
                              ),
                            );
                          },
                        ),

                        InkWell(
                          onTap: () async {
                            Navigator.pushReplacementNamed(
                              context,
                              AppRoutes.loginViewRouteName,
                            );
                          },
                          child: Text('تمتلك حساب بالفعل؟ تسجيل دخول'),
                        ),
                      ],
                    );
                  },
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
