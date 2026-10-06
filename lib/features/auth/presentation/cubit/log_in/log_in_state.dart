import 'package:taswek/features/auth/domain/entites/user_entity.dart';

sealed class LogInState {}

final class LogInInitial extends LogInState {}

final class LogInLoading extends LogInState {}

final class LogInSuccess extends LogInState {
  final UserEntity userEntity;

  LogInSuccess({required this.userEntity});
}

final class LogInFailure extends LogInState {
  final String errorMessage;

  LogInFailure({required this.errorMessage});
}
