import 'package:firebase_auth/firebase_auth.dart';
import 'package:login_stateful_firebase/src/model/user.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  User _userFromFirebaseUser(FirebaseUser user) {
    return user != null ? User(uid: user.uid) : null;
  }

  // listening firebase events
  Stream<User> get user$ {
    return _auth.onAuthStateChanged.map(_userFromFirebaseUser);
  }

  // sign in ano
  Future signInAnon() async {
    try {
      AuthResult result = await _auth.signInAnonymously();
      FirebaseUser user = result.user;
      // print(user.uid);
      this._userFromFirebaseUser(user);

      return user;
    } catch (error) {
      print(error.toString());
      return null;
    }
  }

  Future signUpWithEmailAndPassword(String email, String password) async {
    try {
      AuthResult result = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      FirebaseUser user = result.user;
      print(user.uid);
      this._userFromFirebaseUser(user);

      return user;
    } catch (error) {
      print(error.toString());
      return null;
    }
  }

  Future signInWithEmailAndPassword(String email, String password) async {
    try {
      AuthResult result = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
//      print(result);
      FirebaseUser user = result.user;
      print(user.uid);

      this._userFromFirebaseUser(user);

      return user;
    } catch (error) {
      print(error.toString());
      return null;
    }
  }

  Future signOut() async {
    try {
      await _auth.signOut();
    } catch (error) {
      print(error.toString());
    }
  }
}
