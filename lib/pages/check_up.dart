import 'package:flutter/material.dart';

class CheckUp extends StatefulWidget {
  const CheckUp({Key? key}) : super(key: key);

  @override
  _CheckUpState createState() => _CheckUpState();
}

class _CheckUpState extends State<CheckUp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text('Check Up')),
      ),
    );
  }
}
