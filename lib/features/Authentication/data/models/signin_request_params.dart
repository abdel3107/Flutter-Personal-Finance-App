
import 'package:json_annotation/json_annotation.dart';

part 'signin_request_params.g.dart';

@JsonSerializable()
class SigninRequestParams {
  final String phoneNumber;
  final String password;

  SigninRequestParams({
    required this.phoneNumber,
    required this.password});

  factory SigninRequestParams.fromJson(Map<String, dynamic> json) => _$SigninRequestParamsFromJson(json);

  Map<String, dynamic> toJson() => _$SigninRequestParamsToJson(this);
}

