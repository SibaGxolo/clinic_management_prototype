import 'package:flutter/material.dart';

class MedicalEmergancy extends StatefulWidget {
  const MedicalEmergancy({Key? key}) : super(key: key);

  @override
  _MedicalEmergancyState createState() => _MedicalEmergancyState();
}

class _MedicalEmergancyState extends State<MedicalEmergancy> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Medical Emergancy'),
      ),
    );
  }
}
