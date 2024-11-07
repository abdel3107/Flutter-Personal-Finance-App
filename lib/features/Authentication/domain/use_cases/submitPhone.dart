import 'package:dartz/dartz.dart';
import 'package:ongere/core/di/injector.dart';
import 'package:ongere/core/usecase/usecase.dart';

import '../repositories/auth_repo.dart';

class SubmitPhoneUseCase implements UseCase<Either, String> {
  @override
  Future<Either> call({String ? param}) {
    return s1<AuthRepository>().submitPhone(param!);
  }

}