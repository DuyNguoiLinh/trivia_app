import 'dart:async';
import 'package:trivia_app_with_flutter/src/features/user/presentation/controller/router_controller.dart';
import '../../domain/repository/user_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final loginProvider = StateProvider.autoDispose<int>((ref) => 0);

class SignUpNotifier extends AutoDisposeAsyncNotifier<void> {

  final userRepository = UserRepository.create();
  String _uid ='';

  @override
  FutureOr<void> build() {

    final authState = ref.watch(authStateProvider);
    _uid = authState.asData?.value?.uid ?? '';
  }

  // Sign in
  Future<void> signIn(String email, String passWord) async {
    try {
      await userRepository.login(email, passWord);
    } catch (err, stackTr) {
      state=AsyncValue.error(err, stackTr);
    }
  }

  // Sign Up
  Future<void> signUp(String email, String passWord, String username) async {
    try {
      await userRepository.signUp(email, passWord, username);
    } catch (err, stackTr) {
      state=AsyncValue.error(err, stackTr);
    }
  }

  // Sign out
  Future <void> signOut() async {
    try {
      await userRepository.signOut(_uid);
    } catch (err, stackTr) {
      return Future.error(err, stackTr);
    }
  }

  //  sign in by google account
  Future <void> signInWithGoogle() async {
    try {
      await userRepository.signInWithGoogle();
    } catch (err, stackTr) {
      state=AsyncValue.error(err, stackTr);
    }
  }

  // Link google account
  Future<void> linkGoogleAccount() async {
    try {
      await userRepository.linkGoogleAccount();
    } catch (err, stackTr) {
      state=AsyncValue.error(err, stackTr);
    }
  }


  Future<void> deleteAccount() async {
    try {
      await userRepository.deleteAccount(_uid);
    } catch (err, stackTr) {
      return Future.error(err, stackTr);
    }
  }
  // forget password
  Future<void> sendPasswordResetEmail(String email) async {
    try {
      await userRepository.sendPasswordResetEmail(email);
    } catch (err, stackTr) {
      return Future.error(err, stackTr);
    }
  }

 //   fetch question
  Future<void> fetchQuestionFavorite() async {
    // await userRepository.fetchQuestionFavorite(_uid);
  }
}

  final appProvider = AsyncNotifierProvider.autoDispose<SignUpNotifier,
      void>(() => SignUpNotifier());