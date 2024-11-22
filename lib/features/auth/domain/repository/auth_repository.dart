
import 'package:dartz/dartz.dart';

import '../../data/models/create_user.dart';
import '../../data/models/sign_in_user.dart';

abstract class AuthRepository {

  Future<Either> signup(CreateUser createUser);

  Future<Either> signin(SigninUser signinUser);

  Future<Either> getUser();
}