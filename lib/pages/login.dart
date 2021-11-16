import 'package:clinic_management_prototype/pages/register.dart';
import 'package:clinic_management_prototype/widgets/button.dart';
import 'package:clinic_management_prototype/widgets/inputfield.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'landing_page.dart';

class Login extends StatelessWidget {
  const Login({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Center(
          child: Text('Login'),
        ),
        automaticallyImplyLeading: false,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 25,
              ),
              Text(
                'Clinic Management',
                style: GoogleFonts.lato(
                  color: Colors.blue,
                  fontWeight: FontWeight.w700,
                  fontSize: 35,
                ),
              ),
              const SizedBox(height: 25),
              const InputField(
                  labelText: 'Username',
                  hintText: 'Enter the username you signed up with',
                  obscureText: false,
                  textinputtype: TextInputType.text),
              const InputField(
                  labelText: 'Password',
                  hintText: 'Enter your secure password',
                  obscureText: true,
                  textinputtype: TextInputType.text),
              ButtonBar(
                alignment: MainAxisAlignment.end,
                children: [
                  Column(
                    children: [
                      Button(
                          buttontext: 'Login',
                          onPressed: () {
                            Navigator.push(
                                context,
                                //Login button redirects the app to the landing page
                                MaterialPageRoute(
                                    builder: (context) => const Landing()));
                          }),
                      const SizedBox(height: 10),
                      Button(
                          buttontext: 'Register',
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const Register()));
                          }),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 150),
              TextButton(
                onPressed: () {},
                child: const Align(
                  alignment: Alignment.bottomCenter,
                  child: Text(
                    "Forgot your passsword",
                    style: TextStyle(fontSize: 20.0),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
