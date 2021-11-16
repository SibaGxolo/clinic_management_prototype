import 'package:clinic_management_prototype/defaults.dart';
import 'package:clinic_management_prototype/main.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// import 'package:clinic_management_prototype/pages/login.dart';
class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Center(
          child: Text(
            'Home',
          ),
        ),
      ),
      body: ListView(
        children: [
          const SizedBox(
            height: 50,
          ),
          Image.asset(
            'assets/checkup.jpg',
            width: 200,
            height: 150,
          ),
          Text('Check up / Follow Up',
              textAlign: TextAlign.center,
              style: GoogleFonts.lato(
                color: Colors.blue,
                fontWeight: FontWeight.w700,
                fontSize: 15,
              )),
          //fit: BoxFit.cover),
          const SizedBox(
            height: 50,
          ),
          Image.asset(
            'assets/medicalemergancy.jpg',
            width: 200,
            height: 150,
          ),
          Text('Sick / Medical Emergancy',
              textAlign: TextAlign.center,
              style: GoogleFonts.lato(
                color: Colors.blue,
                fontWeight: FontWeight.w700,
                fontSize: 15,
              )),
          // fit: BoxFit.cover),
          const SizedBox(
            height: 40,
          ),
          Image.asset('assets/medication.jpg', width: 200, height: 150),

          const SizedBox(
            height: 5,
          ),

          Text('Medication Delivery',
              textAlign: TextAlign.center,
              style: GoogleFonts.lato(
                color: Colors.blue,
                fontWeight: FontWeight.w700,
                fontSize: 15,
              )),
          // fit: BoxFit.cover),
          const SizedBox(
            height: 50,
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: (value) {
          setState(() {
            indexClicked = value;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Defaults.bottomNavItemIcon[0],
            ),
            label: Defaults.bottomNavItemText[0],
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Defaults.bottomNavItemIcon[1],
            ),
            label: Defaults.bottomNavItemText[1],
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Defaults.bottomNavItemIcon[2],
            ),
            label: Defaults.bottomNavItemText[2],
          ),
        ],
      ),
    );
  }

  void setState(Null Function() param0) {}
}
