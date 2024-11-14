import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:ongere/core/constants/api_urls.dart';
import 'package:ongere/core/di/injector.dart';
import 'package:ongere/core/network/dio_client.dart';

import '../models/otpConfirmRequestParams.dart';
import '../models/signin_request_params.dart';
import '../models/signup_request_params.dart';

abstract class AuthApiService {

  Future<Either> submitPhone(String phone);
  
  Future<Either> confirmOtp(OtpRequestParams params);

  Future<Either> signup(SignupRequestParams signupRequestParams);

  Future<Either> signin(SigninRequestParams signinRequestParams);

}

class AuthApiServiceImplementation extends AuthApiService {

  @override
  Future<Either> signup(SignupRequestParams signupRequestParams) async {
    try {
      var response = await s1<DioClient>().post(
        ApiUrls.register,
        data: signupRequestParams.toJson(),
      );
      return Right(response);
    } on DioException catch (e) {
      return Left(e.response!.data["message"]);
    }
  }

  @override
  Future<Either> signin(SigninRequestParams signinRequestParams) async {
    try {
      var response = await s1<DioClient>().post(
        ApiUrls.authenticate,
        data: signinRequestParams,
      );
      return Right(response);
    } on DioException catch(e){
      return Left(e.response!.data["message"]);
    }
  }

  @override
  Future<Either> submitPhone(String phone) async {
    try {
      var response = await s1<DioClient>().get(
        ApiUrls.getOTP,
        queryParameters: {
          "phoneNumber": phone
        },
      );
      return Right(response);
    }
    on DioException catch (e) {
      return Left(e.response!.data["message"]);
    }
  }

  @override
  Future<Either> confirmOtp(OtpRequestParams params) async {
    try {
      var response = await s1<DioClient>().get(
        ApiUrls.confirmOTP,
        queryParameters: {
          "phoneNumber": params.phoneNumber,
          "code": params.code
        },
      );
      return Right(response);
    } on DioException catch (e) {
      return Left(e.response!.data['message']);
    }
  }

}