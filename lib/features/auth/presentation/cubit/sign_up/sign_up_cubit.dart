import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:taswek/features/auth/domain/repos/auth_repo.dart';

import 'sign_up_state.dart';

class SignUpCubit extends Cubit<SignUpState> {
  final AuthRepo authRepo;
  SignUpCubit(this.authRepo) : super(SignUpInitial());

  final TextEditingController nameController = TextEditingController();
  final TextEditingController mailSignUpController = TextEditingController();
  final TextEditingController passSignupController = TextEditingController();
  bool isShowPassword = false;
  bool isAccepted = false;

  void toggleTerms(bool? value) {
    isAccepted = value ?? false;
    emit(SignUpInitial());
  }

  void showPassword() {
    isShowPassword = !isShowPassword;
    emit(SignUpInitial());
  }

  Future<void> createUserWithmailAndPassword(
    String name,
    String email,
    String password,
  ) async {
    emit(SignUpLoading());

    final result = await authRepo.createUserWithmailAndPassword(
      email,
      password,
      name,
    );

    result.fold(
      (failure) {
        emit(SignUpFailure(errorMessage: failure.message));
      },
      (userdata) {
        emit(SignUpSuccess(userEntity: userdata));
      },
    );
  }
}
