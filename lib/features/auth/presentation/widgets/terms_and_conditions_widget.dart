import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:taswek/features/auth/presentation/cubit/sign_up/sign_up_cubit.dart';
import 'package:taswek/features/auth/presentation/cubit/sign_up/sign_up_state.dart';

class TermsAndConditionsWidget extends StatelessWidget {
  const TermsAndConditionsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignUpCubit, SignUpState>(
      builder: (context, state) {
        final cubit = context.read<SignUpCubit>();
        return Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Transform.translate(
              offset: Offset(0, -8),
              child: Checkbox(
                value: cubit.isAccepted,
                onChanged: (newValue) {
                  cubit.toggleTerms(newValue);
                },
                activeColor: const Color(0xFF1B5E20),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(6),
                ),
                side: BorderSide(color: Colors.grey.shade400, width: 1.5),
              ),
            ),

            Expanded(
              child: Text.rich(
                TextSpan(
                  children: [
                    const TextSpan(
                      text: 'من خلال إنشاء حساب , فإنك توافق على ',
                      style: TextStyle(color: Colors.grey, fontSize: 14),
                    ),
                    TextSpan(
                      text: 'الشروط\nوالأحكام الخاصة بنا',
                      style: TextStyle(
                        color: Color(0xFF1B5E20), // Dark green color
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                textAlign: TextAlign.right,
              ),
            ),
          ],
        );
      },
    );
  }
}
