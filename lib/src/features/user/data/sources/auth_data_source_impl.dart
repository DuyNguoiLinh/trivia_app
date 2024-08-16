import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'firestore_data_source_impl.dart';
import 'auth_error.dart';
import 'auth_data_source.dart';

class AuthDataSourceImpl implements AuthDataSource {

  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  final fireStore = FirestoreDataSourceImpl();


  // Sign up
  @override
  Future<User?> signUpUser(
      String email, String passWord, String userName) async {
    try {
      final credential = await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: passWord,
      );
      return credential.user;

    } on FirebaseAuthException catch (e) {
      final error = FirebaseAuthError.fromFirebaseAuthException(e);
      return Future.error(error);

    } catch (err) {
      return Future.error(Exception(err));
    }
  }

  // Sign in
  @override
  Future<User?> signInUser(String email, String passWord) async {
    try {
      await FirebaseAuth.instance.setSettings(appVerificationDisabledForTesting: true);
      final credential = await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: passWord,
      );
       return credential.user;

    } on FirebaseAuthException catch (e) {
      final error = FirebaseAuthError.fromFirebaseAuthException(e);
      return Future.error(error);

    } catch (err) {
      return Future.error(Exception(err));
    }
  }

  // Sign out
  @override
  Future<void> signOut() async {
    try {
      await _firebaseAuth.signOut();
      await _googleSignIn.signOut();
    } catch (err) {
      return Future.error(Exception(err));
    }
  }

//   sign in with google
  @override
  Future<User?> signInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

      final GoogleSignInAuthentication? googleAuth =
          await googleUser?.authentication;

      final credential = GoogleAuthProvider.credential(
          accessToken: googleAuth?.accessToken, idToken: googleAuth?.idToken);

      final UserCredential userCredential =
          await FirebaseAuth.instance.signInWithCredential(credential);

      return userCredential.user;

    } catch (err) {
      return Future.error(Exception(err));
    }
  }

  //  Connect with google account
  @override
  Future<void> linkGoogleAccount() async {
    try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

      final GoogleSignInAuthentication? googleAuth =
          await googleUser?.authentication;

      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );

      User? user = FirebaseAuth.instance.currentUser;

      if (user != null) {
        await user.linkWithCredential(credential);
      }
    } on FirebaseAuthException catch (e) {
      final error = FirebaseAuthError.fromFirebaseAuthException(e);
      return Future.error(error);
    } catch (err) {
      return Future.error(Exception(err));
    }
  }

//   Delete account
  @override
  Future<void> deleteAccount(String uid) async {
    try {
      User? user = FirebaseAuth.instance.currentUser;
      await _googleSignIn.signOut();
      await user?.delete();
    } catch (err) {
      return Future.error(Exception(err));
    }
  }

  @override
  Future<void> sendPasswordResetEmail(String email) async {
    try {
      await _firebaseAuth.sendPasswordResetEmail(email: email);
    } catch (err) {
      return Future.error(Exception(err));
    }
  }
}
