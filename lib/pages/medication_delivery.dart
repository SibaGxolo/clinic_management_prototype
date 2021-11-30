import 'package:clinic_management_prototype/preferences.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class MedicationDelivery extends StatefulWidget {
  const MedicationDelivery({Key? key}) : super(key: key);

  @override
  _MedicationDeliveryState createState() => _MedicationDeliveryState();
}

class _MedicationDeliveryState extends State<MedicationDelivery> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Medication Delivery'),
      ),
      body: Container(
        child: Column(
          children: [
            Text('Hello ' )
          ],
        ),
      )
    );
  }
}
