import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class FirebaseAuthAPI {

  final FirebaseAuth _auth = FirebaseAuth.instance; // firebase session
  final GoogleSignIn googleSignIn = GoogleSignIn(); // google session

  Future<User> signIn() async {
    GoogleSignInAccount googleSignInAccount = await googleSignIn.signIn();
    GoogleSignInAuthentication gSA = await googleSignInAccount.authentication;

    final GoogleAuthCredential googleCredential = GoogleAuthProvider.credential(accessToken: gSA.accessToken, idToken: gSA.idToken);
    final UserCredential googleUserCredential = await FirebaseAuth.instance.signInWithCredential(googleCredential);

    final firebaseUser = googleUserCredential.user ;
    return firebaseUser;
  }

  signOut() async {
    await _auth.signOut().then((value) => print("¡ session cerrada !"));
    googleSignIn.signOut();
    print("¡ google session cerrada !");
  }

  getMyUser() {
    return FirebaseAuth.instance.currentUser;
  }

}