// ignore_for_file: prefer_const_constructors

import 'package:clinic_management_prototype/pages/distributer_register.dart';
import 'package:clinic_management_prototype/pages/driver_register.dart';
import 'package:clinic_management_prototype/pages/login.dart';
import 'package:clinic_management_prototype/pages/nurse_register.dart';
import 'package:clinic_management_prototype/pages/patient_register.dart';
import 'package:clinic_management_prototype/widgets/button.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final items = ['Patient', 'Nurse', 'Driver', 'Distributor'];
  String? value;
  void valuechanged(_value) {
    setState(() {
      value = _value;
    });

    if (_value == 'Patient') {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => Patient()));
    } else if (_value == 'Nurse') {
      Navigator.push(context, MaterialPageRoute(builder: (context) => Nurse()));
    } else if (_value == 'Driver') {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => Driver()));
    } else if (_value == 'Distributor') {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => Distributor()));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Center(child: Text('Registration')),
        automaticallyImplyLeading: false,
      ),
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              SizedBox(
                height: 20,
              ),
              Text(
                'Select below what you want to register as:',
                textAlign: TextAlign.center,
                style: GoogleFonts.lato(
                  color: Colors.blue,
                  fontWeight: FontWeight.w700,
                  fontSize: 25,
                ),
              ),
              SizedBox(
                height: 100,
              ),
              Container(
                margin: EdgeInsets.all(35),
                padding: EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: Colors.blue, width: 4)),
                child: DropdownButtonHideUnderline(
                  child: DropdownButton<String>(
                    value: value,
                    iconSize: 30,
                    icon: Icon(Icons.arrow_drop_down, color: Colors.blue),
                    isExpanded: true,
                    items: items.map(buildMenuItem).toList(),
                    onChanged: (_value) => valuechanged(_value),
                    hint: Text('Select here',
                        style: TextStyle(
                          color: Colors.blue,
                        )),
                  ),
                ),
              ),
              SizedBox(height: 200),
              Button(
                  buttontext: 'Cancel',
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => const Login()));
                  }),
            ],
          ),
        ),
      ),
    );
  }

  DropdownMenuItem<String> buildMenuItem(String item) => DropdownMenuItem(
        value: item,
        child: Text(
          item,
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
        ),
      );
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
