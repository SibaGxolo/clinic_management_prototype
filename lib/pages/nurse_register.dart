import 'package:clinic_management_prototype/pages/distribution_hall.dart';
import 'package:clinic_management_prototype/pages/login.dart';
import 'package:clinic_management_prototype/pages/password.dart';
import 'package:clinic_management_prototype/pages/register.dart';
import 'package:clinic_management_prototype/widgets/button.dart';
import 'package:clinic_management_prototype/widgets/inputfield.dart';
import 'package:flutter/material.dart';


class Nurse extends StatelessWidget {
  const Nurse({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Center(
          child: Text('Register as a nurse'),
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
                  labelText: 'Name',
                  hintText: 'Enter your name',
                  obscureText: false,
                  textinputtype: TextInputType.text),
              const InputField(
                  labelText: 'Surname',
                  hintText: 'Enter your surname',
                  obscureText: false,
                  textinputtype: TextInputType.text),
              const InputField(
                  labelText: 'ID number',
                  hintText: 'Enter your ID number',
                  obscureText: false,
                  textinputtype: TextInputType.phone),
              const InputField(
                  labelText: 'Nurse personnel number ',
                  hintText: 'Enter your nurse personel number',
                  obscureText: false,
                  textinputtype: TextInputType.phone),
              const InputField(
                  labelText: 'Clinic address',
                  hintText: 'Enter your address',
                  obscureText: false,
                  textinputtype: TextInputType.text),
              const InputField(
                  labelText: 'Cell Phone',
                  hintText: 'Enter your cell number',
                  obscureText: false,
                  textinputtype: TextInputType.phone),
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
                                builder: (context) => const Login()));
                      }),
                  Button(
                      buttontext: 'Proceed',
                      onPressed: () {
                        showDialog(
                            barrierDismissible: false,
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                title: const Center(
                                    child: Text(
                                  'In the case of medical delivery, please register the distribution hall',
                                  textAlign: TextAlign.center,
                                )),
                                actions: [
                                  ButtonBar(
                                      alignment: MainAxisAlignment.spaceAround,
                                      children: [
                                        UserChoice(
                                            onPressed: () {
                                              Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          const DistributionHall()));
                                            },
                                            textbutton: 'Register Hall'),
                                        UserChoice(
                                            onPressed: () {
                                              Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          const Password()));
                                            },
                                            textbutton: 'Continue Registration',),
                                            
                                            
                                      ])
                                ],
                              );
                            });
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