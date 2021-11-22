import 'package:clinic_management_prototype/pages/distribution_hall.dart';
import 'package:clinic_management_prototype/pages/login.dart';
import 'package:clinic_management_prototype/pages/password.dart';
import 'package:clinic_management_prototype/pages/register.dart';
import 'package:clinic_management_prototype/widgets/button.dart';
import 'package:clinic_management_prototype/widgets/camera.dart';
import 'package:clinic_management_prototype/widgets/inkwell.dart';
import 'package:clinic_management_prototype/widgets/inputfield.dart';
import 'package:flutter/material.dart';

class Nurse extends StatefulWidget {
  const Nurse({Key? key}) : super(key: key);

  @override
  _NurseState createState() => _NurseState();
}

class _NurseState extends State<Nurse> {
  @override
  Widget build(BuildContext context) {
    var _chosenImage;
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
              Stack(
                children: [
                  Container(
                    margin: const EdgeInsets.symmetric(
                        vertical: 30, horizontal: 30),
                    child: CircleAvatar(
                      radius: 65,
                      backgroundColor: Colors.blueAccent,
                      child: CircleAvatar(
                        radius: 65,
                        backgroundImage: _chosenImage == null
                            ? null
                            : FileImage(_chosenImage),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 120,
                    left: 110,
                    child: Camera(
                        icon: Icons.add_a_photo,
                        onPressed: () {
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                title: const Text(
                                  'Choose option to upload ID photo',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    color: Colors.blueAccent,
                                  ),
                                ),
                                content: SingleChildScrollView(
                                  child: Column(
                                    children: const [
                                      InkWeLL(
                                          icon: Icons.camera, text: 'Camera'),
                                      InkWeLL(
                                          icon: Icons.image, text: 'Gallery'),
                                      InkWeLL(
                                          icon: Icons.remove_circle,
                                          text: 'Remove'),
                                    ],
                                  ),
                                ),
                              );
                            },
                          );
                        }),
                  )
                ],
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
                                            textbutton:
                                                'Continue Registration'),
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
