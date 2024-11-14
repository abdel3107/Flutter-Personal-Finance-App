import 'package:dartz/dartz.dart';
import 'package:ongere/core/usecase/usecase.dart';
import 'package:ongere/features/Authentication/data/models/signup_request_params.dart';
import 'package:ongere/features/Authentication/domain/repositories/auth_repo.dart';

import '../../../../core/di/injector.dart';
import '../../data/models/signin_request_params.dart';

class SigninUseCase implements UseCase<Either, SigninRequestParams> {

  @override
  Future<Either> call({SigninRequestParams ? param}) {
    return s1<AuthRepository>().signin(param!);
  }
}