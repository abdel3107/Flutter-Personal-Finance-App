import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:ongere/core/di/injector.dart';
import 'package:ongere/features/Authentication/domain/use_cases/isLoggedIn.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthInitial()) {
    on<AuthEvent>((event, emit) {
      // TODO: implement event handler
    });

    on<AppStartEvent>((event, emit) async {
      var isLoggedIn = await s1<IsLoggedInUseCase>().call();
      if(isLoggedIn) {
        print("Islogged in ${isLoggedIn}");
        emit(Authenticated());
      }
      else {
        print("Islogged in ${isLoggedIn}");
        emit(Unauthenticated());
      }
    });

  }
}
