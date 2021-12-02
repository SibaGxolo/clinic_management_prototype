import 'package:clinic_management_prototype/pages/home_page.dart';
import 'package:clinic_management_prototype/widgets/button.dart';
import 'package:flutter/material.dart';

class MedicationDelivery extends StatefulWidget {
  const MedicationDelivery({Key? key}) : super(key: key);

  @override
  _MedicationDeliveryState createState() => _MedicationDeliveryState();
}

class _MedicationDeliveryState extends State<MedicationDelivery> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Center(
            child: Text('Medical Delivery'),
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
                    buttontext: 'Dismis',
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  const Home())); //testing home page
                    }),
                Button(buttontext: 'Unavailable', onPressed: () {}),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
