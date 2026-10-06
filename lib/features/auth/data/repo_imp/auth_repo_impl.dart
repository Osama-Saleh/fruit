import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:taswek/core/errors/exceptions.dart';
import 'package:taswek/core/errors/failures.dart';
import 'package:taswek/core/services/data_base.dart';
import 'package:taswek/core/services/firebase_auth_service.dart';
import 'package:taswek/features/auth/data/model/user_model.dart';
import 'package:taswek/features/auth/domain/entites/user_entity.dart';
import 'package:taswek/features/auth/domain/repos/auth_repo.dart';

class AuthRepoImpl extends AuthRepo {
  final FirebaseAuthService firebaseAuthService;
  final DataBaseService dataBaseService;
  AuthRepoImpl({
    required this.firebaseAuthService,
    required this.dataBaseService,
  });
  @override
  Future<Either<Failures, UserEntity>> createUserWithmailAndPassword(
    String emailAddress,
    String password,
    String name,
  ) async {
    User? user;
    try {
      user = await firebaseAuthService.createUserWithmailAndPassword(
        emailAddress: emailAddress,
        password: password,
      );

      // await user.updateDisplayName(name);
      final userModel = UserModel(
        name: name,
        email: user.email ?? emailAddress,
        userId: user.uid,
      );
      await addUserData(user: userModel);
      // UserEntity userEntity = await getUserData(docId: user.uid);

      return right(userModel);
    } on CustomException catch (e) {
      if (user != null) {
        await firebaseAuthService.deleteUser();
      }
      return left(ServerFailure(message: e.message));
    } catch (e) {
      if (user != null) {
        await firebaseAuthService.deleteUser();
      }
      return left(ServerFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failures, UserEntity>> loginWithmailAndPassword(
    String emailAddress,
    String password,
  ) async {
    try {
      final user = await firebaseAuthService.signInWithEmailAndPassword(
        emailAddress: emailAddress,
        password: password,
      );
      UserEntity userEntity = await getUserData(docId: user.uid);
      return right(userEntity);
    } on CustomException catch (e) {
      return left(ServerFailure(message: e.message));
    } catch (e) {
      return left(ServerFailure(message: e.toString()));
    }
  }

  @override
  Future addUserData({required UserModel user}) async {
    try {
      await dataBaseService.addData(pathName: 'usersData', data: user.toJson());
    } on CustomException catch (e) {
      log("Error adding data to firestore: ${e.toString()}");
    }
  }

  @override
  Future<UserEntity> getUserData({required String docId}) async {
    try {
      final user = await dataBaseService.getData(
        pathName: 'usersData',
        docId: docId,
      );
      final userModel = UserModel.fromJson(user);
      return userModel;
    } on CustomException catch (e) {
      throw CustomException(message: "Error getting data from firestore");
    } catch (e) {
      throw CustomException(message: "Error getting data from firestore");
    }
  }
}
