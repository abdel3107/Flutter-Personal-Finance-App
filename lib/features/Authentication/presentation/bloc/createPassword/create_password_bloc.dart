import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'create_password_event.dart';
part 'create_password_state.dart';

class CreatePasswordBloc extends Bloc<CreatePasswordEvent, CreatePasswordState> {
  CreatePasswordBloc() : super(CreatePasswordInitial()) {
    on<CreatePasswordEvent>((event, emit) {
      // TODO: implement event handler
    });

    on<SubmitPasswordEvent>((event, emit) async {
      emit(CreatePasswordWaiting());
      emit(CreatePasswordSuccess(password: event.password));
    });

  }
}
