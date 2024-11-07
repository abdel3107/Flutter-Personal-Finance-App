part of 'phone_number_bloc.dart';

@immutable
sealed class PhoneState {}

final class PhoneNumberInitial extends PhoneState {}

final class PhoneNumberState extends PhoneState {
  final String phoneNumber;

  PhoneNumberState(this.phoneNumber);

}
