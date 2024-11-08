part of 'resend_otp_bloc.dart';

@immutable
sealed class ResendOtpEvent {}

final class ActivateResendOtpEvent extends ResendOtpEvent {}

final class DesactivateResendOtpEvent extends ResendOtpEvent {}
