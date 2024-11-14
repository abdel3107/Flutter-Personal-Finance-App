part of 'signin_bloc.dart';

@immutable
sealed class SigninEvent {}

final class LoginEvent extends SigninEvent {
  final SigninRequestParams params;

  LoginEvent({required this.params});
}