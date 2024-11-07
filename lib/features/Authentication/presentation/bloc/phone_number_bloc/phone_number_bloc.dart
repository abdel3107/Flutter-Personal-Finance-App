import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:ongere/features/Authentication/domain/use_cases/submitPhone.dart';

import '../../../../../core/di/injector.dart';

part 'phone_number_event.dart';
part 'phone_number_state.dart';

class PhoneNumberBloc extends Bloc<PhoneNumberEvent, PhoneState> {
  PhoneNumberBloc() : super(PhoneNumberInitial()) {

    on<PhoneNumberSubmission>((event, emit) {
      if (event.phoneNumber.isNotEmpty) {
        String phoneNumberWithoutIndic = event.phoneNumber.substring(1);
        s1<SubmitPhoneUseCase>().call(
          param: phoneNumberWithoutIndic
        );
        emit(PhoneNumberState(event.phoneNumber));
      }
    });

  }

}
