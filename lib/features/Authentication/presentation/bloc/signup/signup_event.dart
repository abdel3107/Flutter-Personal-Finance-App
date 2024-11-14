part of 'signup_bloc.dart';

@immutable
sealed class SignupEvent {}

final class RegisterEvent extends SignupEvent {
  final SignupRequestParams params;

  RegisterEvent({required this.params});

}
