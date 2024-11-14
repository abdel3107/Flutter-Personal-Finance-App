part of 'signin_bloc.dart';

@immutable
sealed class SigninState {}

final class SigninInitial extends SigninState {}

final class SigninSuccess extends SigninState {}

final class SigninFailed extends SigninState {}

final class SigninWaiting extends SigninState {}
