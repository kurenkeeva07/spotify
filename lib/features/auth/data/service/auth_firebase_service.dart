import 'dart:ui';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../../../core/configs/constans/app_urls.dart';
import '../../domain/entities/user_entity.dart';
import '../models/create_user.dart';
import '../models/sign_in_user.dart';
import '../models/user.dart';

abstract class AuthFirebaseService {

  Future<Either> signup(CreateUser createUser);

  Future<Either> signin(SigninUser signinUser);

  Future<Either> getUser();
}

class AuthFirebaseServiceImpl extends AuthFirebaseService {


  @override
  Future<Either> signin(SigninUser signinUser) async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: signinUser.email,
          password:signinUser.password
      );

      return const Right('Signin was Successful');

    } on FirebaseAuthException catch(e) {
      String message = '';

      if(e.code == 'invalid-email') {
        message = 'Not user found for that email';
      } else if (e.code == 'invalid-credential') {
        message = 'Wrong password provided for that user';
      }


      return Left(message);
    }
  }

  @override
  Future<Either> signup(CreateUser createUser) async {
    try {

      var data =  await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: createUser.email,
          password:createUser.password
      );

      FirebaseFirestore.instance.collection('Users').doc(data.user?.uid)
          .set(
          {
            'name' : createUser.fullName,
            'email' : data.user?.email,
          }
      );

      return const Right('Signup was Successful');

    } on FirebaseAuthException catch(e) {
      String message = '';

      if(e.code == 'weak-password') {
        message = 'The password provided is too weak';
      } else if (e.code == 'email-already-in-use') {
        message = 'An account already exists with that email.';
      }


      return Left(message);
    }
  }

  @override
  Future < Either > getUser() async {
    try {
      FirebaseAuth firebaseAuth = FirebaseAuth.instance;
      FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

      var user = await firebaseFirestore.collection('Users').doc(
          firebaseAuth.currentUser?.uid
      ).get();

      UserModel userModel = UserModel.fromJson(user.data() !);
      userModel.imageURL = firebaseAuth.currentUser?.photoURL ?? AppURLs.defaultImage;
      UserEntity userEntity = userModel.toEntity();
      return Right(userEntity);
    } catch (e) {
      return const Left('An error occurred');
    }
  }
}