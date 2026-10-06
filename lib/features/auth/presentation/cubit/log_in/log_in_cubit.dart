import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:taswek/features/auth/domain/repos/auth_repo.dart';
import 'package:taswek/features/auth/presentation/cubit/log_in/log_in_state.dart';

class LogInCubit extends Cubit<LogInState> {
  final AuthRepo authRepo;
  LogInCubit({required this.authRepo}) : super(LogInInitial());

  final TextEditingController mailController = TextEditingController();
  final TextEditingController passController = TextEditingController();
  bool isShowPassword = false;

  void showPassword() {
    isShowPassword = !isShowPassword;
    emit(LogInInitial());
  }

  Future<void> loginWithmailAndPassword({
    required String email,
    required String password,
  }) async {
    emit(LogInLoading());
    final result = await authRepo.loginWithmailAndPassword(email, password);
    result.fold(
      (failure) {
        emit(LogInFailure(errorMessage: failure.message));
      },
      (user) {
        emit(LogInSuccess(userEntity: user));
      },
    );
  }
}
