import 'package:flutter/material.dart';

class IconProfile extends StatefulWidget {
  const IconProfile({Key? key}) : super(key: key);

  @override
  _IconProfileState createState() => _IconProfileState();
}

class _IconProfileState extends State<IconProfile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text('Profile')),
      ),
    );
  }
}
