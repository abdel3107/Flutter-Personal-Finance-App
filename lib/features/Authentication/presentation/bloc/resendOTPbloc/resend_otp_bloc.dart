import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'resend_otp_event.dart';

class ResendOtpBloc extends Bloc<ResendOtpEvent, bool> {
  ResendOtpBloc() : super(false) {

    on<ResendOtpEvent>((event, emit) {
      // TODO: implement event handler
    });

    on<ActivateResendOtpEvent>((event, emit) {
      emit(true);
    });

  on<DesactivateResendOtpEvent>((event, emit) {
    emit(false);
  });

  }
}
