import 'package:clinic_management_prototype/preferences.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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
                  Text(
                    '${Preferences.user!.user!.displayName}',
                    style: GoogleFonts.lato(
                      color: Colors.blue,
                      fontWeight: FontWeight.w700,
                      fontSize: 35,
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
