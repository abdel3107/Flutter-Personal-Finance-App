// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'signup_request_params.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SignupRequestParams _$SignupRequestParamsFromJson(Map<String, dynamic> json) =>
    SignupRequestParams(
      firstName: json['firstName'] as String,
      lastName: json['lastName'] as String,
      countryCode: json['countryCode'] as String,
      phoneNumber: json['phoneNumber'] as String,
      email: json['email'] as String,
      password: json['password'] as String,
    );

Map<String, dynamic> _$SignupRequestParamsToJson(
        SignupRequestParams instance) =>
    <String, dynamic>{
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'countryCode': instance.countryCode,
      'phoneNumber': instance.phoneNumber,
      'email': instance.email,
      'password': instance.password,
    };
