import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Register extends StatelessWidget {
  const Register({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Center(
          child: Text('Register'),
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(
              height: 25,
            ),
            Center(
              child: Text(
                'Register as a:',
                style: GoogleFonts.lato(
                  color: Colors.blue,
                  fontWeight: FontWeight.w700,
                  fontSize: 35,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
