//This class saves the UserId and can be used anywhere in the application.
//It also helps you find the information the user registered with.
import 'package:firebase_auth/firebase_auth.dart';

class Preferences {
  static String? uid;
  static UserCredential? user;
}
