import 'package:dartz/dartz.dart';
import 'package:taswek/core/errors/failures.dart';
import 'package:taswek/features/auth/data/model/user_model.dart';
import 'package:taswek/features/auth/domain/entites/user_entity.dart';

abstract class AuthRepo {
  Future<Either<Failures,UserEntity>> createUserWithmailAndPassword(
    String emailAddress,
    String password,
    String name,
  );
  Future<Either<Failures,UserEntity>> loginWithmailAndPassword(
    String emailAddress,
    String password,
  );

  Future addUserData({
   required UserModel user
  });
   Future getUserData({
    required String docId,
  });
   Future saveUserData({
    required UserEntity user,
  });
  
} 
