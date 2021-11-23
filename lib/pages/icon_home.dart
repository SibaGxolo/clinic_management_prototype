//import 'package:clinic_management_prototype/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class IconHome extends StatefulWidget {
  const IconHome({Key? key}) : super(key: key);

  @override
  _IconHomeState createState() => _IconHomeState();
}

class _IconHomeState extends State<IconHome> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: Center(
          child: SpinKitFadingCircle(
            color: Colors.blue,
            size: 50,
          ),
        ),
      ),
    );
  }
}
