import 'package:clinic_management_prototype/pages/nurse_register.dart';
import 'package:clinic_management_prototype/pages/password.dart';
import 'package:clinic_management_prototype/widgets/button.dart';
import 'package:clinic_management_prototype/widgets/inputfield.dart';
import 'package:flutter/material.dart';

class DistributionHall extends StatelessWidget {
  const DistributionHall({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Center(
          child: Text('Register Distribution Hall'),
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
              const InputField(
                  labelText: 'Distribution Hall Name',
                  hintText: 'Enter the name of the distribution hall',
                  obscureText: false,
                  textinputtype: TextInputType.text),
              const InputField(
                  labelText: 'Distribution Hall Address',
                  hintText: 'Enter the distribution center address',
                  obscureText: false,
                  textinputtype: TextInputType.text),
              const InputField(
                  labelText: 'Distribution center number',
                  hintText: 'Enter the distribution center number',
                  obscureText: false,
                  textinputtype: TextInputType.phone),
              const InputField(
                  labelText: 'Number of employees ',
                  hintText:
                      'Enter the number of employees in the distribution hall',
                  obscureText: false,
                  textinputtype: TextInputType.phone),
              const InputField(
                  labelText: 'Distribution Hall manager',
                  hintText:
                      'Please provide the name of the distribution hall manager',
                  obscureText: false,
                  textinputtype: TextInputType.text),
              const SizedBox(
                height: 25,
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
                                builder: (context) => const Nurse()));
                      }),
                  Button(
                      buttontext: 'Proceed',
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const Password()));
                      }),
                ],
              ),
              const SizedBox(
                height: 10,
              )
            ],
          ),
        ),
      ),
    );
  }
}
