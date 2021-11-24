import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../preferences.dart';

class AuthService {
  final FirebaseAuth _auth;

  AuthService(this._auth);

  Stream<User?> get authStateChanges => _auth.idTokenChanges();

  Future<String> login(String email, String password) async {
    try{
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      return "Logged In";
    } catch(e) {
      return "failed";
    }
  }

  Future<String?> signUp(String email, String password) async {
    try{
      await _auth.createUserWithEmailAndPassword(email: email, password: password).then((value) async {
        User? user = FirebaseAuth.instance.currentUser;
        Preferences.uid = user!.uid;
      });
      return "Signed Up";
    } catch(e) {
      return "failed";
    }
  }

  Future signOut() async{

    try{
      _auth.signOut();
    }catch(e) {
      return "logout failed";
    }

  }
}