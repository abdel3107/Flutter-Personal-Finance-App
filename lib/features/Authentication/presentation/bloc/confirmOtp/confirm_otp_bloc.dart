import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:ongere/core/di/injector.dart';
import 'package:ongere/features/Authentication/data/models/otpConfirmRequestParams.dart';
import 'package:ongere/features/Authentication/domain/use_cases/confirmOtp.dart';

part 'confirm_otp_event.dart';
part 'confirm_otp_state.dart';

class ConfirmOtpBloc extends Bloc<ConfirmOtpEvent, ConfirmOtpState> {
  ConfirmOtpBloc() : super(ConfirmOtpInitial()) {

    on<ConfirmOtpEvent>((event, emit) {
      // TODO: implement event handler
    });

    on<SendConfirmOtpEvent>((event, emit) async {
      emit(ConfirmOtpWaiting());
      OtpRequestParams params = OtpRequestParams(
        phoneNumber: event.phoneNumber,
        code: event.code,
      );
      try {
        var response = await s1<ConfirmOtpUseCase>().call(param: params);
        if(response.isRight()){
          emit(ConfirmOtpSuccess());
        }
        else{
          emit(ConfirmOtpFailure(failureMessage: response.toString()));
        }
      } catch (e) {
        emit(ConfirmOtpFailure(failureMessage: e.toString()));
      }
    });

  }
}
