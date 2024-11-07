import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:ongere/core/constants/api_urls.dart';
import 'package:ongere/core/di/injector.dart';
import 'package:ongere/core/network/dio_client.dart';

import '../models/signup_request_params.dart';

abstract class AuthApiService {

  Future<Either> submitPhone(String phone);

  Future<Either> signup(SignupRequestParams signupRequestParams);

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
        }
      );
      return Right(response);
    }
    on DioException catch(e) {
      return Left(e.response!.data["message"]);
    }
  }

}