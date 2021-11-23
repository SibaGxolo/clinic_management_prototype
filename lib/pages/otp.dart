import 'package:clinic_management_prototype/pages/home_page.dart';
import 'package:clinic_management_prototype/pages/login.dart';
import 'package:clinic_management_prototype/widgets/button.dart';
import 'package:clinic_management_prototype/widgets/inputfield.dart';
import 'package:flutter/material.dart';

class OneTimePin extends StatelessWidget {
  const OneTimePin({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Center(
          child: Text('OTP'),
        ),
        automaticallyImplyLeading: false,
      ),
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 200),
            const InputField(
                labelText: 'One time pin',
                hintText: 'Enter the OTP sent via SMS',
                obscureText: false,
                textinputtype: TextInputType.phone),
            const SizedBox(height: 240),
            ButtonBar(
              alignment: MainAxisAlignment.spaceBetween,
              children: [
                Button(
                    buttontext: 'Cancel',
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const Login()));
                    }),
                Button(
                    buttontext: 'Proceed',
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const Home()));
                    }),
              ],
            ),
          ],
        ),
      )),
    );
  }
}
