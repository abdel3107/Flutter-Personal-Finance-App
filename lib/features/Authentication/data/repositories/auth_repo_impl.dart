
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:ongere/features/Authentication/data/data_sources/auth_api_service.dart';
import 'package:ongere/features/Authentication/data/data_sources/auth_local_service.dart';
import 'package:ongere/features/Authentication/data/models/signin_request_params.dart';
import 'package:ongere/features/Authentication/domain/repositories/auth_repo.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../core/di/injector.dart';
import '../models/otpConfirmRequestParams.dart';
import '../models/signup_request_params.dart';

class AuthRepositoryImplementation extends AuthRepository {
  @override
  Future<Either> signup(SignupRequestParams signupRequestParams) async {
    Either response = await s1<AuthApiService>().signup(signupRequestParams);
    return response.fold(
            (error){
              return Left(error);
            },
            (data) async {
              Response response = data;
              SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
              sharedPreferences.setString('token', response.data['token']);
              return Right(response);
            }
    );
  }

  @override
  Future<Either> signin(SigninRequestParams signinRequestParams) async {
    Either response = await s1<AuthApiService>().signin(signinRequestParams);
    return response.fold(
            (error){
              return Left(error);
            },
            (data) async {
              Response response = data;
              SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
              sharedPreferences.setString('token', response.data['token']);
              return Right(response);
            }
    );
  }

  @override
  Future<Either> submitPhone(String phone) async {
    return s1<AuthApiService>().submitPhone(phone);
  }

  @override
  Future<Either> confirmOtp(OtpRequestParams params) {
    return s1<AuthApiService>().confirmOtp(params);
  }

  @override
  Future<bool> isLoggedIn() async {
    return await s1<AuthLocalService>().isLoggedIn();
  }
  

}