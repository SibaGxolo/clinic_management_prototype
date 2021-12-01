import 'dart:io';

import 'package:clinic_management_prototype/pages/distribution_hall.dart';
import 'package:clinic_management_prototype/pages/login.dart';
import 'package:clinic_management_prototype/pages/password.dart';
import 'package:clinic_management_prototype/pages/register.dart';
import 'package:clinic_management_prototype/widgets/button.dart';
import 'package:clinic_management_prototype/widgets/camera.dart';
import 'package:clinic_management_prototype/widgets/inkwell.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

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
  dynamic _chosenImage;

  //The 3 void classes below serve the purpose of allowing the three icons (camera, gallery and remove) clickable
  //and also allows them to reach their respective paths

  Future<void> _chosenImageCamera() async {
    final picker = ImagePicker();
    final pickedImage = await picker.pickImage(source: ImageSource.camera);
    final pickedImageFile = File(pickedImage!.path);
    setState(() {
      _chosenImage = pickedImageFile;
    });
  }
  Future<void> _chosenImageGallery() async {
    final picker = ImagePicker();
    final pickedImage = await picker.pickImage(source: ImageSource.gallery);
    final pickedImageFile = File(pickedImage!.path);
    setState(() {
      _chosenImage = pickedImageFile;
    });

  } 
  void _remove(){
    setState(() {
      _chosenImage = null;
    });
  }

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
          child: Form(
            key: _key,
            child: Column(
              children: [
                SizedBox(
                  height: (MediaQuery.of(context).size.height * 2.5) / 100,
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
                                            onTapped: _chosenImageCamera),
                                        InkWeLL(
                                            icon: Icons.image,
                                            text: 'Gallery',
                                            onTapped: _chosenImageGallery),
                                        InkWeLL(
                                            icon: Icons.remove_circle,
                                            text: 'Remove',
                                            onTapped: _remove),
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
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: TextFormField(
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
                ),
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: TextFormField(
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
                ),
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: TextFormField(
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
                ),
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: TextFormField(
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
                ),
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: TextFormField(
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
                ),
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: TextFormField(
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
                ),
                SizedBox(
                  height: (MediaQuery.of(context).size.height * 2.5) / 100,
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
