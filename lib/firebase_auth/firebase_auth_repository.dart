import 'package:firebase_auth/firebase_auth.dart';

import 'firebase_auth_google.dart';


class AuthRepository{
  FirebaseAuthAPI firebaseAuthAPI = FirebaseAuthAPI();

  Future<User> tryToLoginUser() => firebaseAuthAPI.signIn();

  Future<void> signOut() => firebaseAuthAPI.signOut();

  User getMyUser() => firebaseAuthAPI.getMyUser();
}