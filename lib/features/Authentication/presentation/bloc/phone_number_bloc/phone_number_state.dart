part of 'phone_number_bloc.dart';

@immutable
sealed class PhoneState {}

final class PhoneNumberInitial extends PhoneState {}

final class PhoneSubmissionSucsessState extends PhoneState {
  final String phoneNumber;

  PhoneSubmissionSucsessState(this.phoneNumber);

}
final class PhoneSubmissionFailureState extends PhoneState {
  final String errorMessage;
  PhoneSubmissionFailureState(this.errorMessage);
}
