part of 'signup_bloc.dart';

@immutable
sealed class SignupState {}

final class SignupInitial extends SignupState {}

final class SignupSuccessState extends SignupState {
  final String message;
  SignupSuccessState({required this.message});
}

final class SignupFailureState extends SignupState {
  final String message;

  SignupFailureState({required this.message});
}

final class SignupWaitingState extends SignupState {}
