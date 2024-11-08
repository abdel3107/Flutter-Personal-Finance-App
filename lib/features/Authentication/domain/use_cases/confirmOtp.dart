
import 'package:dartz/dartz.dart';
import 'package:ongere/core/di/injector.dart';
import 'package:ongere/core/usecase/usecase.dart';
import 'package:ongere/features/Authentication/data/data_sources/auth_api_service.dart';
import 'package:ongere/features/Authentication/data/models/otpConfirmRequestParams.dart';

class ConfirmOtpUseCase implements UseCase<Either, OtpRequestParams> {
  @override
  Future<Either> call({OtpRequestParams? param}) {

    return s1<AuthApiService>().confirmOtp(param!);
  }

}