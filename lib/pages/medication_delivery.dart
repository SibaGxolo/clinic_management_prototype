import 'package:flutter/material.dart';

class MedicationDelivery extends StatefulWidget {
  const MedicationDelivery({ Key? key }) : super(key: key);

  @override
  _MedicationDeliveryState createState() => _MedicationDeliveryState();
}

class _MedicationDeliveryState extends State<MedicationDelivery> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Medication Delivery'),
      ),
    );
  }
}