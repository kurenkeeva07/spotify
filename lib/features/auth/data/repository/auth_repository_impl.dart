import 'package:dartz/dartz.dart';
import '../../../../core/di/service_locator.dart';
import '../../domain/repository/auth_repository.dart';
import '../models/create_user.dart';
import '../models/sign_in_user.dart';
import '../service/auth_firebase_service.dart';

class AuthRepositoryImpl extends AuthRepository {


  @override
  Future<Either> signin(SigninUser signinUser) async {
    return await getIt<AuthFirebaseService>().signin(signinUser);
  }

  @override
  Future<Either> signup(CreateUser createUser) async {
    return await getIt<AuthFirebaseService>().signup(createUser);
  }

  @override
  Future<Either> getUser() async {
    return await getIt<AuthFirebaseService>().getUser();
  }

}