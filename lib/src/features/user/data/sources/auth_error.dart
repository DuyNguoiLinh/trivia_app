import 'package:firebase_auth/firebase_auth.dart';

enum AuthErrorEnum {
  weakPassword,
  emailAlreadyInUse,
  userNotFound,
  wrongPassword,
  providerAlreadyLinked,
  invalidCredential,
  credentialAlreadyInUse,
  unknownError,
}

class FirebaseAuthError implements Exception {
  final AuthErrorEnum errCode;
  final String message;

  FirebaseAuthError._(this.errCode, this.message);

  factory FirebaseAuthError.fromFirebaseAuthException(FirebaseAuthException e) {
    switch (e.code) {
      case "weak-password":
        return FirebaseAuthError._(
          AuthErrorEnum.weakPassword,
          "The password provided is too weak.",
        );
      case "email-already-in-use":
        return FirebaseAuthError._(
          AuthErrorEnum.emailAlreadyInUse,
          "The account already exists for that email.",
        );
      case "user-not-found":
        return FirebaseAuthError._(
          AuthErrorEnum.userNotFound,
          "No user found for that email.",
        );
      case "wrong-password":
        return FirebaseAuthError._(
          AuthErrorEnum.wrongPassword,
          "Wrong password provided for that user.",
        );
      case "provider-already-linked":
        return FirebaseAuthError._(
          AuthErrorEnum.providerAlreadyLinked,
          "The provider has already been linked to the user.",
        );
      case "invalid-credential":
        return FirebaseAuthError._(
          AuthErrorEnum.invalidCredential,
          "The provider's credential is not valid.",
        );
      case "credential-already-in-use":
        return FirebaseAuthError._(
          AuthErrorEnum.credentialAlreadyInUse,
          "The account corresponding to the credential already exists, or is already linked to a Firebase User.",
        );
      default:
        return FirebaseAuthError._(
          AuthErrorEnum.unknownError,
          "An unknown error occurred.",
        );
    }
  }

}
