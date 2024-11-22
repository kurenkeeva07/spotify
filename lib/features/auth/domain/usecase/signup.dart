import 'package:dartz/dartz.dart';
import 'package:my_spotify/service_locator.dart';

import '../../../../core/usecase/usecase.dart';
import '../../data/models/create_user.dart';
import '../repository/auth_repository.dart';


class SignupUseCase implements UseCase<Either,CreateUser> {


  @override
  Future<Either> call({CreateUser ? params}) async {
    return getIt<AuthRepository>().signup(params!);
  }

}