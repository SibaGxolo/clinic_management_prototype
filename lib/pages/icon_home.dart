//import 'package:clinic_management_prototype/pages/home_page.dart';
import 'package:clinic_management_prototype/pages/check_up.dart';
import 'package:clinic_management_prototype/pages/medical_emergancy.dart';
import 'package:clinic_management_prototype/pages/medication_delivery.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
//This class is for the bottom home navigation, to browse through the stipulated navigation bar.
class IconHome extends StatelessWidget {
  const IconHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Center(
          child: Text(
            'Home',
          ),
        ),
        automaticallyImplyLeading: false,
      ),
      body: Center(
        child: Column(
          children: [
            const SizedBox(
              height: 100,
            ),
            Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
              //picture needs to be clickable
              InkWell(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => const CheckUp()));
                },
                child: Container(
                  width: (MediaQuery.of(context).size.width * 42) / 100,
                  height: (MediaQuery.of(context).size.height * 20) / 100,
                  padding: const EdgeInsets.all(10),
                  margin: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    border: Border.all(
                      width: 2,
                    ),
                  ),
                  child: Column(
                    children: [
                      Image.asset(
                        'assets/checkup.jpg',
                        width: (MediaQuery.of(context).size.width * 20) / 100,
                        height: (MediaQuery.of(context).size.height * 10) / 100,
                      ),
                      Text('Check up /\n Follow Up',
                          textAlign: TextAlign.center,
                          style: GoogleFonts.lato(
                            color: Colors.black,
                            fontWeight: FontWeight.w700,
                            fontSize: 15,
                          )),
                    ],
                  ),
                ),
              ),

              //picture needs to be clickable
              InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const MedicalEmergancy()));
                },
                child: Container(
                  width: (MediaQuery.of(context).size.width * 42) / 100,
                  height: (MediaQuery.of(context).size.height * 20) / 100,
                  padding: const EdgeInsets.all(10),
                  margin: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    border: Border.all(
                      width: 2,
                    ),
                  ),
                  child: Column(
                    children: [
                      Image.asset(
                        'assets/medicalemergancy.jpg',
                        width: (MediaQuery.of(context).size.width * 20) / 100,
                        height: (MediaQuery.of(context).size.height * 10) / 100,
                      ),
                      Text(
                        'Sick /\n Medical Emergancy',
                        textAlign: TextAlign.center,
                        style: GoogleFonts.lato(
                          color: Colors.black,
                          fontWeight: FontWeight.w700,
                          fontSize: 15,
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ]),

            const SizedBox(
              height: 75,
            ),
            //picture needs to be clickable
            InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const MedicationDelivery()));
              },
              child: Container(
                width: (MediaQuery.of(context).size.width * 42) / 100,
                height: (MediaQuery.of(context).size.height * 20) / 100,
                padding: const EdgeInsets.all(10),
                margin: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  border: Border.all(
                    width: 2,
                  ),
                ),
                child: Column(
                  children: [
                    Image.asset(
                      'assets/medication.jpg',
                      width: (MediaQuery.of(context).size.width * 20) / 100,
                      height: (MediaQuery.of(context).size.height * 10) / 100,
                    ),
                    Text('Medication Delivery',
                        textAlign: TextAlign.center,
                        style: GoogleFonts.lato(
                          color: Colors.black,
                          fontWeight: FontWeight.w700,
                          fontSize: 15,
                        )),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
