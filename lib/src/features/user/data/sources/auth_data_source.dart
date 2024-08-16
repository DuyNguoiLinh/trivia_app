import 'package:firebase_auth/firebase_auth.dart';

import 'auth_data_source_impl.dart';

abstract class AuthDataSource {

  Future<User?>  signUpUser(String email, String passWord,String userName);

  Future<User?>  signInUser(String email, String passWord);

  Future<void> signOut();

  Future<User?>  signInWithGoogle();


  Future<void> linkGoogleAccount();

  Future<void> deleteAccount(String uid);

  Future<void> sendPasswordResetEmail(String email);

  factory AuthDataSource.create() {
    return AuthDataSourceImpl();
  }

}