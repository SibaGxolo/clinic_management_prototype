import 'dart:async';

import 'package:clinic_management_prototype/pages/login.dart';
import 'package:flutter/material.dart';

//This class is used for the purpose of notifying users that they have completed the registration and will then take them back to the login page,
//To login with the details they just registered with.

class Complete extends StatelessWidget {
  const Complete({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Completepage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class Completepage extends StatefulWidget {
  const Completepage({Key? key}) : super(key: key);

  @override
  _CompletepageState createState() => _CompletepageState();
}

class _CompletepageState extends State<Completepage> {
  @override
  void initState() { //The initstate allows the below code to change from one state to another by allowing the use of the timer,
                    //changing from a state of the widget to a different page after a stipulated time. 
    super.initState();
    Timer(
        const Duration(seconds: 5),
        () => Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => const Login())));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.white,
        child: Image.asset(
          'assets/complete.2.jpg',
        ));
  }
}
