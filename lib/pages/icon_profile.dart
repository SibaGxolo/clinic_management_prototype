import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class IconProfile extends StatefulWidget {
  const IconProfile({Key? key}) : super(key: key);

  @override
  _IconProfileState createState() => _IconProfileState();
}

class _IconProfileState extends State<IconProfile> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Center(child: Text('Profile')),
        ),
        body: const Center(
          child: SpinKitFadingCircle(
            color: Colors.blue,
            size: 50,
          ),
        ),
      ),
    );
  }
}
