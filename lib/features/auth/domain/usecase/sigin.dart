import 'package:dartz/dartz.dart';
import 'package:my_spotify/service_locator.dart';

import '../../../../core/usecase/usecase.dart';
import '../../data/models/sign_in_user.dart';
import '../repository/auth_repository.dart';

class SigninUseCase implements UseCase<Either,SigninUser> {


  @override
  Future<Either> call({SigninUser ? params}) async {
    return getIt<AuthRepository>().signin(params!);
  }
}