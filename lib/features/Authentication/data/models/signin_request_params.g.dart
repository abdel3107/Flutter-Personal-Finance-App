// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'signin_request_params.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SigninRequestParams _$SigninRequestParamsFromJson(Map<String, dynamic> json) =>
    SigninRequestParams(
      phoneNumber: json['phoneNumber'] as String,
      password: json['password'] as String,
    );

Map<String, dynamic> _$SigninRequestParamsToJson(
        SigninRequestParams instance) =>
    <String, dynamic>{
      'phoneNumber': instance.phoneNumber,
      'password': instance.password,
    };
