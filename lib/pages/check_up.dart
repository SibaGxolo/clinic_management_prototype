import 'package:clinic_management_prototype/pages/home_page.dart';
import 'package:clinic_management_prototype/widgets/button.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CheckUp extends StatefulWidget {
  const CheckUp({Key? key}) : super(key: key);

  @override
  _CheckUpState createState() => _CheckUpState();
}

class _CheckUpState extends State<CheckUp> {
  DateTime _choosenDate = DateTime.now();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: const Center(
            child: Text('Check up'),
          ),
          automaticallyImplyLeading: false,
        ),
        body: Column(
          children: [
            SizedBox(
              height: (MediaQuery.of(context).size.height * 7.5) / 100,
            ),
            Center(
              child: Text(
                _choosenDate == null
                    ? 'Nothing has been picked yet'
                    : 'Booked in for: ${_choosenDate.day}/${_choosenDate.month}/${_choosenDate.year}',
                style: GoogleFonts.lato(
                  color: Colors.blue,
                  fontWeight: FontWeight.w700,
                  fontSize: 25,
                ),
              ),
            ),
            SizedBox(
              height: (MediaQuery.of(context).size.height * 12) / 100,
            ),
            InkWell(
              onTap: () {
                showDatePicker(
                  context: context,
                  initialDate: _choosenDate,
                  firstDate: DateTime(2021),
                  lastDate: DateTime(2022),
                  helpText: 'Select booking date', // Can be used as title
                  cancelText: 'Not now',
                  confirmText: 'Book',
                ).then((date) {
                  setState(() {
                    _choosenDate = date!;
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
                      'assets/calender.png',
                      width: (MediaQuery.of(context).size.width * 40) / 100,
                      height: (MediaQuery.of(context).size.height * 20) / 100,
                    ),
                    Text('Pick a date',
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
              height: (MediaQuery.of(context).size.height * 19) / 100,
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
