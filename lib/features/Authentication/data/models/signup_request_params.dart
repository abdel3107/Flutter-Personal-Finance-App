
import 'package:json_annotation/json_annotation.dart';

part 'signup_request_params.g.dart';

@JsonSerializable()
class SignupRequestParams {
  final String firstName;
  final String lastName;
  final String phoneNumber;
  final String password;

  SignupRequestParams({
    required this.firstName,
    required this.lastName,
    required this.phoneNumber,
    required this.password});

  factory SignupRequestParams.fromJson(Map<String, dynamic> json) => _$SignupRequestParamsFromJson(json);

  Map<String, dynamic> toJson() => _$SignupRequestParamsToJson(this);
}

