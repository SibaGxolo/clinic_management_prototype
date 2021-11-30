import 'package:clinic_management_prototype/pages/distribution_hall.dart';
import 'package:clinic_management_prototype/pages/login.dart';
import 'package:clinic_management_prototype/pages/password.dart';
import 'package:clinic_management_prototype/pages/register.dart';
import 'package:clinic_management_prototype/widgets/button.dart';
import 'package:clinic_management_prototype/widgets/camera.dart';
import 'package:clinic_management_prototype/widgets/inkwell.dart';
import 'package:flutter/material.dart';

class Nurse extends StatefulWidget {
  const Nurse({Key? key}) : super(key: key);

  @override
  _NurseState createState() => _NurseState();
}

class _NurseState extends State<Nurse> {
  final _key = GlobalKey<FormState>();

  final TextEditingController _namecontroller = TextEditingController();
  final TextEditingController _surnamecontroller = TextEditingController();
  final TextEditingController _idcontroller = TextEditingController();
  final TextEditingController _personnelcontroller = TextEditingController();
  final TextEditingController _cliniccontroller = TextEditingController();
  final TextEditingController _cellcontroller = TextEditingController();
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
          child: Form(
            key: _key,
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
                                      children: [
                                        InkWeLL(
                                            icon: Icons.camera,
                                            text: 'Camera',
                                            onTaped: () {}),
                                        InkWeLL(
                                            icon: Icons.image,
                                            text: 'Gallery',
                                            onTaped: () {}),
                                        InkWeLL(
                                            icon: Icons.remove_circle,
                                            text: 'Remove',
                                            onTaped: () {}),
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
                TextFormField(
                  controller: _namecontroller,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'field cannot be empty';
                    } else {
                      return null;
                    }
                  },
                  obscureText: false,
                  keyboardType: TextInputType.text,
                  // ignore: prefer_const_constructors
                  decoration: InputDecoration(
                    labelText: 'Name',
                    hintText: 'enter name here',
                  ),
                ),
                TextFormField(
                  controller: _surnamecontroller,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'field cannot be empty';
                    } else {
                      return null;
                    }
                  },
                  obscureText: false,
                  keyboardType: TextInputType.text,
                  // ignore: prefer_const_constructors
                  decoration: InputDecoration(
                    labelText: 'Surname',
                    hintText: 'enter surname here',
                  ),
                ),
                TextFormField(
                  controller: _idcontroller,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'field cannot be empty';
                    } else {
                      return null;
                    }
                  },
                  obscureText: false,
                  keyboardType: TextInputType.phone,
                  // ignore: prefer_const_constructors
                  decoration: InputDecoration(
                    labelText: 'ID Number',
                    hintText: 'enter id number here',
                  ),
                ),
                TextFormField(
                  controller: _personnelcontroller,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'field cannot be empty';
                    } else {
                      return null;
                    }
                  },
                  obscureText: false,
                  keyboardType: TextInputType.number,
                  // ignore: prefer_const_constructors
                  decoration: InputDecoration(
                    labelText: 'Nurse Personnel Number',
                    hintText: 'enter personnel number here',
                  ),
                ),
                TextFormField(
                  controller: _cliniccontroller,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'field cannot be empty';
                    } else {
                      return null;
                    }
                  },
                  obscureText: false,
                  keyboardType: TextInputType.streetAddress,
                  // ignore: prefer_const_constructors
                  decoration: InputDecoration(
                    labelText: 'Clinic Address',
                    hintText: 'enter address here',
                  ),
                ),
                TextFormField(
                  controller: _cellcontroller,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'field cannot be empty';
                    } else {
                      return null;
                    }
                  },
                  obscureText: false,
                  keyboardType: TextInputType.phone,
                  // ignore: prefer_const_constructors
                  decoration: InputDecoration(
                    labelText: 'Cellphone number',
                    hintText: 'enter cellphone number here',
                  ),
                ),
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
                                  builder: (context) =>
                                      const Login())); //testing home page
                        }),
                    Button(
                        buttontext: 'Proceed',
                        onPressed: () {
                          if (_key.currentState!.validate()) {
                            return;
                          } else {
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
                                          alignment:
                                              MainAxisAlignment.spaceAround,
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
                          }
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
      ),
    );
  }
}
