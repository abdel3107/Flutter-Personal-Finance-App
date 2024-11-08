part of 'confirm_otp_bloc.dart';

@immutable
sealed class ConfirmOtpEvent {}

final class SendConfirmOtpEvent extends ConfirmOtpEvent {
  final String phoneNumber;
  final String code;

  SendConfirmOtpEvent({
    required this.phoneNumber,
    required this.code
});
}
