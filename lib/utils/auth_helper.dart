import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthHelper {
  AuthHelper._();

  static final AuthHelper authHelper = AuthHelper._();

  static GoogleSignIn googleSignIn = GoogleSignIn();
  static FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  Future<Map<String, dynamic>> signInWithGoogle() async {
    Map<String, dynamic> res = {};

    try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

      final GoogleSignInAuthentication? googleAuth =
          await googleUser?.authentication;

      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );
      UserCredential userCredential =
          await firebaseAuth.signInWithCredential(credential);

      User? user = userCredential.user;
      res['user'] = user;
    } catch (e) {
      res['user'] = "${e}";
    }
    return res;
  }

  Future<void> logOut() async {
    await googleSignIn.signOut();
  }
}
