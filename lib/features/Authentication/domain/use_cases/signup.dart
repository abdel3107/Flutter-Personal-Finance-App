import 'package:dartz/dartz.dart';
import 'package:ongere/core/usecase/usecase.dart';
import 'package:ongere/features/Authentication/data/models/signup_request_params.dart';
import 'package:ongere/features/Authentication/domain/repositories/auth_repo.dart';

import '../../../../core/di/injector.dart';

class SignupUseCase implements UseCase<Either, SignupRequestParams> {

  @override
  Future<Either> call({SignupRequestParams ? param}) {
    return s1<AuthRepository>().signup(param!);
  }
}