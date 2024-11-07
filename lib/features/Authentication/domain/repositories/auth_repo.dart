import 'package:dartz/dartz.dart';
import 'package:ongere/features/Authentication/data/models/signup_request_params.dart';

abstract class AuthRepository {

  Future<Either> submitPhone(String phone);

  Future<Either> signup(SignupRequestParams signupRequestParams);
}