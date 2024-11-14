import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:ongere/features/Authentication/data/models/signup_request_params.dart';
import 'package:ongere/features/Authentication/domain/use_cases/signup.dart';

import '../../../../../core/di/injector.dart';

part 'signup_event.dart';
part 'signup_state.dart';

class SignupBloc extends Bloc<SignupEvent, SignupState> {
  SignupBloc() : super(SignupInitial()) {
    on<SignupEvent>((event, emit) {
      // TODO: implement event handler
    });

    on<RegisterEvent>((event, emit) async {
      emit(SignupWaitingState());
      try {
        var response = await s1<SignupUseCase>().call(param: event.params);
        if (response.isRight()){
          emit(SignupSuccessState(message: "Account created with success"));
        }
      } catch (e) {
        emit(SignupFailureState(message: e.toString()));
      }

    });

  }
}
