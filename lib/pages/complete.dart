import 'dart:async';

import 'package:clinic_management_prototype/pages/home_page.dart';
import 'package:flutter/material.dart';

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
  void initState() {
    super.initState();
    Timer(
        Duration(seconds: 5),
        () => Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => Home())));
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
