import 'package:clinic_management_prototype/widgets/inputfield.dart';
import 'package:flutter/material.dart';

class Patient extends StatelessWidget {
  const Patient({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Center(
          child: Text('Register as a patient'),
        ),
        automaticallyImplyLeading: false,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: const [
              SizedBox(
                height: 25,
              ),
              InputField(
                  labelText: 'Name',
                  hintText: 'Enter your name',
                  obscureText: false,
                  textinputtype: TextInputType.text),
              InputField(
                  labelText: 'Surname',
                  hintText: 'Enter your surname',
                  obscureText: false,
                  textinputtype: TextInputType.text),
              InputField(
                  labelText: 'ID number',
                  hintText: 'Enter your ID number',
                  obscureText: false,
                  textinputtype: TextInputType.phone),
              InputField(
                  labelText: 'Clinic card number',
                  hintText: 'Enter the clinic card number',
                  obscureText: true,
                  textinputtype: TextInputType.phone)
            ],
          ),
        ),
      ),
    );
  }
}
