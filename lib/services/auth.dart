import 'package:blog_flutter/model/user.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthService {

  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();

  User _userFromFirebaseUser(FirebaseUser user) {
    return user != null ? User(uid: user.uid, displayName: user.displayName ?? 'Anon') : null;
  }

  //auth change user stream
  Stream<User> get user {
//    return _auth.onAuthStateChanged
//        .map(_userFromFirebaseUser);
      return Stream.value(User(uid: 'lksjdlfkjsdf', displayName: 'lkasjdflkjasdlfkj'));
  }

  //sign in anon
  Future<User> signInAnon() async {
    try {
      AuthResult result = await _auth.signInAnonymously();
      FirebaseUser user = result.user;
      return _userFromFirebaseUser(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  //sign in with email and password
  Future<User> signInEmail(String email, String password) async {
    try {
      AuthResult result = await _auth.signInWithEmailAndPassword(email: email, password: password);
      return _userFromFirebaseUser(result.user);
    } catch (e) {
      return null;
    }
  }

  Future<User> signUpEmail(String email, String password) async {
    try {
      AuthResult result = await _auth.createUserWithEmailAndPassword(email: email, password: password);
      return _userFromFirebaseUser(result.user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  Future<User> signInWithGoogle() async {
    final GoogleSignInAccount googleUser = await _googleSignIn.signIn();
    final GoogleSignInAuthentication googleAuth = await googleUser.authentication;

    final AuthCredential credential = GoogleAuthProvider.getCredential(idToken: googleAuth.idToken, accessToken: googleAuth.accessToken);

    final FirebaseUser user = (await _auth.signInWithCredential(credential)).user;
    print('Signed in with Google');
    return _userFromFirebaseUser(user);
  }

  //register with email and password

  // sign out
  void signOut() {
    try {
      print('sign out start');
      _auth.signOut();
      print('signed out finished');
    } catch(e) {
      print('error catch block of sign out');
      print(e);
      return null;
    }
  }

}