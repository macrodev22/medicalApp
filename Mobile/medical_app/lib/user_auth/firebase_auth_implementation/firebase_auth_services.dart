import 'package:firebase_auth/firebase_auth.dart';

class FirebaseAuthService {
  static final FirebaseAuth _auth = FirebaseAuth.instance;

  static Future<User?> signUpWithEmailAndPassword(
      String email, String password) async {
    try {
      UserCredential credential = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      return credential.user;
    } catch (e) {
      print("An error occured");
      return null;
    }
  }

  static Future<User?> signInWithEmailAndPassword(
      String email, String password) async {
    try {
      UserCredential credential = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      return credential.user;
    } catch (e) {
      print("Unable to signin");
      return null;
    }
  }

  static Future<void> signOut() async {
    await _auth.signOut();
  }

  static Future<User?> get currentUser async {
    User? usr;
    _auth.authStateChanges().listen((user) {
      usr = user;
    });
    return usr;
  }
}
