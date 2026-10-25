import 'dart:convert';

import 'package:taswek/core/services/local_storage.dart';
import 'package:taswek/features/auth/data/model/user_model.dart';
import 'package:taswek/features/auth/domain/entites/user_entity.dart';

UserEntity getUser() {
  var jsonString = SecureStorage.instance.getString(key: 'saveUserData');
  if (jsonString == null || jsonString.isEmpty) {
    return UserModel(name: '', email: '', userId: '');
  }
  var userEntity = UserModel.fromJson(jsonDecode(jsonString));
  return userEntity;
}