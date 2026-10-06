import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:taswek/core/errors/exceptions.dart';

class FirebaseAuthService {
  Future<User> createUserWithmailAndPassword({
    required String emailAddress,
    required String password,
  }) async {
    try {
      final credential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
            email: emailAddress,
            password: password,
          );
      return credential.user!;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        throw CustomException(message: 'كلمة المرور ضعيفة');
      } else if (e.code == 'email-already-in-use') {
        throw CustomException(message: 'الحساب موجود بالفعل');
      }
      throw CustomException(message: 'حدث خطأ ما، يرجى المحاولة مرة أخرى');
    } catch (e) {
      throw CustomException(message: 'حدث خطأ ما، يرجى المحاولة مرة أخرى');
    }
  }

  Future<void> deleteUser() async {
    try{
      await FirebaseAuth.instance.currentUser!.delete();
    }catch(e){
      throw CustomException(message: 'حدث خطأ ما، يرجى تسجيل الدخول مرة أخرى');
    }
  }

  Future<User> signInWithEmailAndPassword({
    required String emailAddress,
    required String password,
  }) async {
    try {
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailAddress,
        password: password,
      );
      return credential.user!;
    }on FirebaseAuthException catch (e) {
      if (e.code == 'invalid-credential') {
        throw CustomException(
          message: 'كلمة المرور أو البريد الإلكتروني غير صحيح',
        );
      } else if (e.code == 'wrong-password') {
        throw CustomException(message: 'كلمة المرور خاطئة');
      } else if (e.code == 'invalid-email') {
        throw CustomException(message: 'البريد الإلكتروني غير صحيح');
      }
      throw CustomException(message: 'حدث خطأ ما، يرجى المحاولة مرة أخرى');
    } catch (e) {
      throw CustomException(message: 'حدث خطأ ما، يرجى المحاولة مرة أخرى');
    }
  }
}
