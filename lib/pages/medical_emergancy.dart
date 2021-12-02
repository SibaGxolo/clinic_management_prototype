import 'package:clinic_management_prototype/pages/home_page.dart';
import 'package:clinic_management_prototype/widgets/button.dart';
import 'package:flutter/material.dart';

class MedicalEmergancy extends StatefulWidget {
  const MedicalEmergancy({Key? key}) : super(key: key);

  @override
  _MedicalEmergancyState createState() => _MedicalEmergancyState();
}

class _MedicalEmergancyState extends State<MedicalEmergancy> {
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
              height: (MediaQuery.of(context).size.height * 25) / 100,
            ),
            Center(
              child: Container(
                padding: const EdgeInsets.all(5.0),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  boxShadow: <BoxShadow>[
                    BoxShadow(
                      blurRadius: 5,
                      offset: Offset(0, 2),
                    ),
                  ],
                ),
                width: (MediaQuery.of(context).size.width * 60) / 100,
                height: (MediaQuery.of(context).size.height * 25) / 100,
              ),
            ),
            SizedBox(
              height: (MediaQuery.of(context).size.height * 25) / 100,
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
                Button(buttontext: 'Confirm', onPressed: () {}),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
