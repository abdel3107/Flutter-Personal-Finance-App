
import 'package:dartz/dartz.dart';
import 'package:ongere/features/Authentication/data/data_sources/auth_api_service.dart';
import 'package:ongere/features/Authentication/domain/repositories/auth_repo.dart';

import '../../../../core/di/injector.dart';
import '../models/signup_request_params.dart';

class AuthRepositoryImplementation extends AuthRepository {
  @override
  Future<Either> signup(SignupRequestParams signupRequestParams) async {
    return s1<AuthApiService>().signup(signupRequestParams);
  }

  @override
  Future<Either> submitPhone(String phone) async {
    return s1<AuthApiService>().submitPhone(phone);
  }

}