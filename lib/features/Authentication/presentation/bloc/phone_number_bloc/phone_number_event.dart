part of 'phone_number_bloc.dart';

@immutable
sealed class PhoneNumberEvent {}

class PhoneNumberSubmissionEvent extends PhoneNumberEvent {
  final String phoneNumber;

  PhoneNumberSubmissionEvent(this.phoneNumber);

}
