import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../preferences.dart';

class AuthService {
  AuthService();

  Stream<User?> get authStateChanges => FirebaseAuth.instance.idTokenChanges();

  Future<String> login(String email, String password) async {
    try {
      Preferences.user = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);

      return "Logged In";
    } catch (e) {
      return "failed";
    }
  }

//Register
  Future signUp(String name, String surname, String id, String cardNumber,
      String collection, String email, String password) async {
    UserCredential userCredential;

    userCredential = await FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email, password: password);

    User? user = FirebaseAuth.instance.currentUser;

    user!.updateDisplayName(name);

    Preferences.user = userCredential;
    Preferences.uid = user.uid;

    await FirebaseFirestore.instance.collection("users").doc(user.uid).set({
      'uid': user.uid,
      'email': email,
      'name': name,
      'surname': surname,
      'idNumber': id,
      'cardNumber': cardNumber,
      'collectionDay': collection,
      'password': password,
    });
  }

  Future signOut() async {
    try {
      FirebaseAuth.instance.signOut();
    } catch (e) {
      return "logout failed";
    }
  }
}
