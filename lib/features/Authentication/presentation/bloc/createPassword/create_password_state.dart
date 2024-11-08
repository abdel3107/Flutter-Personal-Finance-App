part of 'create_password_bloc.dart';

@immutable
sealed class CreatePasswordState {}

final class CreatePasswordInitial extends CreatePasswordState {}

final class CreatePasswordWaiting extends CreatePasswordState {}

final class CreatePasswordSuccess extends CreatePasswordState {
  final String password;

  CreatePasswordSuccess({required this.password});
}

final class CreatePasswordFailure extends CreatePasswordState {}
