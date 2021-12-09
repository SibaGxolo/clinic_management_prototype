import 'package:clinic_management_prototype/pages/login.dart';
import 'package:clinic_management_prototype/preferences.dart';
import 'package:clinic_management_prototype/services/auth.dart';
import 'package:clinic_management_prototype/widgets/button.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

//This code is for the bottom navigation, specifically the profile page, where the user can have the option to logout from the application.

class IconProfile extends StatefulWidget {
  const IconProfile({Key? key}) : super(key: key);

  @override
  _IconProfileState createState() => _IconProfileState();
}

class _IconProfileState extends State<IconProfile> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Center(child: Text('Profile')),
          automaticallyImplyLeading: false,
        ),
        body: Center(
          child: FutureBuilder(
            future: FirebaseFirestore.instance
                .collection('users')
                .doc(Preferences.user!.user!.uid)
                .get(),
            builder: (context, snapshot) {
              return Column(
                children: [
                  SizedBox(
                    height: (MediaQuery.of(context).size.height * 10) / 100,
                  ),
                  Center(
                    child: Text(
                      'Do you want to log ${Preferences.user!.user!.displayName} out?',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.lato(
                        color: Colors.blue,
                        fontWeight: FontWeight.w700,
                        fontSize: 35,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: (MediaQuery.of(context).size.height * 10) / 100,
                  ),
                  Button(
                      buttontext: 'Log out',
                      onPressed: () {
                        AuthService().signOut().then((value) {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const Login()));
                        });
                      })
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
