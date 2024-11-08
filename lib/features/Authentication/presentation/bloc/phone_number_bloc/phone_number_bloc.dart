import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:meta/meta.dart';
import 'package:ongere/features/Authentication/domain/use_cases/submitPhone.dart';

import '../../../../../core/di/injector.dart';

part 'phone_number_event.dart';
part 'phone_number_state.dart';

class PhoneNumberBloc extends Bloc<PhoneNumberEvent, PhoneState> {
  PhoneNumberBloc() : super(PhoneNumberInitial()) {

    on<PhoneNumberSubmissionEvent>((event, emit) async {
      if (event.phoneNumber.isNotEmpty) {
        String phoneNumberWithoutIndic = event.phoneNumber.substring(1);
        try {
          var response = await s1<SubmitPhoneUseCase>().call(
              param: phoneNumberWithoutIndic
          );
          if(response.isRight()){
            emit(PhoneSubmissionSucsessState(event.phoneNumber));
          }else {
            emit(PhoneSubmissionFailureState(response.toString()));
          }

        } catch (e) {
          emit(PhoneSubmissionFailureState(e.toString()));
        }

      }
    });

  }

}
