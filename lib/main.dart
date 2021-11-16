import 'package:clinic_management_prototype/pages/login.dart';
import 'package:flutter/material.dart';
var indexClicked=0; //Index is clicked at position 0
void main() {
  runApp(const MyApp()); 
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) { 
    return const MaterialApp(
      home: LoginPage(),
    );
  }
}

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

