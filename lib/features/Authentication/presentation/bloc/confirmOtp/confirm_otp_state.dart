part of 'confirm_otp_bloc.dart';

@immutable
sealed class ConfirmOtpState {}

final class ConfirmOtpInitial extends ConfirmOtpState {}

final class ConfirmOtpFailure extends ConfirmOtpState {
  final String failureMessage;

  ConfirmOtpFailure({required this.failureMessage});
}

final class ConfirmOtpSuccess extends ConfirmOtpState {}
