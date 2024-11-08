part of 'create_password_bloc.dart';

@immutable
sealed class CreatePasswordEvent {}

final class SubmitPasswordEvent extends CreatePasswordEvent {
  final String password;

  SubmitPasswordEvent({required this.password});
}
