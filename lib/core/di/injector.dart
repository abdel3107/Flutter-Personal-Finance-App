
import 'package:get_it/get_it.dart';
import 'package:ongere/core/network/dio_client.dart';
import 'package:ongere/core/usecase/usecase.dart';
import 'package:ongere/features/Authentication/data/data_sources/auth_api_service.dart';
import 'package:ongere/features/Authentication/data/repositories/auth_repo_impl.dart';
import 'package:ongere/features/Authentication/domain/repositories/auth_repo.dart';
import 'package:ongere/features/Authentication/domain/use_cases/confirmOtp.dart';
import 'package:ongere/features/Authentication/domain/use_cases/signup.dart';
import 'package:ongere/features/Authentication/domain/use_cases/submitPhone.dart';

final GetIt s1 =  GetIt.instance ;

void setupInjector() {

  s1.registerSingleton<DioClient>(DioClient());

  s1.registerSingleton<AuthApiService>(AuthApiServiceImplementation());

  s1.registerSingleton<AuthRepository>(AuthRepositoryImplementation());

  s1.registerSingleton<SignupUseCase>(SignupUseCase());

  s1.registerSingleton<SubmitPhoneUseCase>(SubmitPhoneUseCase());

  s1.registerSingleton<ConfirmOtpUseCase>(ConfirmOtpUseCase());
}