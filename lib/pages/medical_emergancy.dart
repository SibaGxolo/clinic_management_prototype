import 'package:clinic_management_prototype/pages/home_page.dart';
import 'package:clinic_management_prototype/widgets/button.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MedicalEmergancy extends StatefulWidget {
  const MedicalEmergancy({Key? key}) : super(key: key);

  @override
  _MedicalEmergancyState createState() => _MedicalEmergancyState();
}

class _MedicalEmergancyState extends State<MedicalEmergancy> {
  TimeOfDay _timeOfDay = const TimeOfDay(hour: 8, minute: 30);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Center(
            child: Text('Medical Emergancy'),
          ),
          automaticallyImplyLeading: false,
        ),
        body: Column(
          children: [
            SizedBox(
              height: (MediaQuery.of(context).size.height * 5) / 100,
            ),
            Text(
              _timeOfDay == null
                  ? 'No time has been selected'
                  : 'Booked in for today at: ${_timeOfDay.hour}:${_timeOfDay.minute}',
              style: GoogleFonts.lato(
                color: Colors.blue,
                fontWeight: FontWeight.w700,
                fontSize: 25,
              ),
            ),
            SizedBox(
              height: (MediaQuery.of(context).size.height * 15) / 100,
            ),
            InkWell(
              onTap: () {
                showTimePicker(
                  context: context,
                  initialTime: _timeOfDay,
                ).then((value) {
                  setState(() {
                    _timeOfDay = value!;
                  });
                });
              },
              child: Container(
                width: (MediaQuery.of(context).size.width * 60) / 100,
                height: (MediaQuery.of(context).size.height * 30) / 100,
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
                      'assets/clock2.jpg',
                      width: (MediaQuery.of(context).size.width * 40) / 100,
                      height: (MediaQuery.of(context).size.height * 20) / 100,
                    ),
                    Text('Pick a time',
                        textAlign: TextAlign.center,
                        style: GoogleFonts.lato(
                          color: Colors.black,
                          fontWeight: FontWeight.w700,
                          fontSize: 20,
                        )),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: (MediaQuery.of(context).size.height * 18) / 100,
            ),
            ButtonBar(
              alignment: MainAxisAlignment.spaceBetween,
              children: [
                Button(
                    buttontext: 'Cancel',
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  const Home())); //testing home page
                    }),
                Button(
                    buttontext: 'Confirm',
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
      ),
    );
  }
}
