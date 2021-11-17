//import 'package:clinic_management_prototype/pages/home_page.dart';
import 'package:clinic_management_prototype/pages/login.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp()); 
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) { 
    return const MaterialApp(
      home: Login(), 
    );
  }
}


//Took the below code to the home page to see if it works

// class BottomNav extends StatefulWidget {

//   @override
//   _BottomNavState createState() => _BottomNavState();
// }

// class _BottomNavState extends State<BottomNav> {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: MyBottomNavigationBar(),
//     );
//   }
// }

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      builder: (context, child) {
        return const Login();
      },
    );
  }
}

