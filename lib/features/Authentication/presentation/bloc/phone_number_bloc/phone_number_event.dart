part of 'phone_number_bloc.dart';

@immutable
sealed class PhoneNumberEvent {}

class PhoneNumberSubmission extends PhoneNumberEvent {
  final String phoneNumber;

  PhoneNumberSubmission(this.phoneNumber);

}
