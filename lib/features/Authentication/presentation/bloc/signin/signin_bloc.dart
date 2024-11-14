import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:ongere/features/Authentication/data/models/signin_request_params.dart';
import 'package:ongere/features/Authentication/domain/use_cases/signin.dart';

import '../../../../../core/di/injector.dart';

part 'signin_event.dart';
part 'signin_state.dart';

class SigninBloc extends Bloc<SigninEvent, SigninState> {
  SigninBloc() : super(SigninInitial()) {
    on<SigninEvent>((event, emit) {
      // TODO: implement event handler
    });

    on<LoginEvent>((event, emit) async {
      emit(SigninWaiting());
      try {
        var response = await s1<SigninUseCase>().call(param: event.params);
        if (response.isRight()){
          emit(SigninSuccess());
        }
      } catch (e) {
        emit(SigninFailed());
      }
    });
  }
}
