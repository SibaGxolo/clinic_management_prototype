// ignore_for_file: prefer_const_constructors, prefer_const_constructors_in_immutables

import 'package:clinic_management_prototype/pages/patient.dart';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Register extends StatelessWidget {
  Register({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        //kkm code
        title: Text('Registeration'),
      ),
      body: Center(
        child: Column(children: [
          SizedBox(height: 100),
          Text('Select from the botton what you want to register as:',
              textAlign: TextAlign.center,
              style: GoogleFonts.lato(
                color: Colors.blue,
                fontWeight: FontWeight.w700,
                fontSize: 25,
              )),
          SizedBox(
            height: 20,
          ),
          UserChoice(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Patient()));
              },
              textbutton: 'Patient'),
          SizedBox(height: 5),
          UserChoice(onPressed: () {}, textbutton: 'Nurse'),
          SizedBox(height: 5),
          UserChoice(onPressed: () {}, textbutton: 'Driver'),
          SizedBox(height: 5),
          UserChoice(onPressed: () {}, textbutton: 'Distributor'),
          SizedBox(height: 5),
          UserChoice(onPressed: () {}, textbutton: 'Hall'),
        ]),
      ),
    );
  } //kkm code
}

class UserChoice extends StatelessWidget {
  final GestureTapCallback onPressed;
  final String textbutton;

  const UserChoice({
    Key? key,
    required this.onPressed,
    required this.textbutton,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: Text(
        textbutton,
        style: TextStyle(fontSize: 25),
      ),
    );
  }
}
