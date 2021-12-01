import 'dart:io';

import 'package:clinic_management_prototype/pages/login.dart';
import 'package:clinic_management_prototype/pages/password.dart';
import 'package:clinic_management_prototype/widgets/button.dart';
import 'package:clinic_management_prototype/widgets/camera.dart';
import 'package:clinic_management_prototype/widgets/inkwell.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class Driver extends StatefulWidget {
  const Driver({Key? key}) : super(key: key);

  @override
  _DriverState createState() => _DriverState();
}

class _DriverState extends State<Driver> {
  final _key = GlobalKey<FormState>();

  final TextEditingController _namecontroller = TextEditingController();
  final TextEditingController _surnamecontroller = TextEditingController();
  final TextEditingController _idcontroller = TextEditingController();
  final TextEditingController _licencecontroller = TextEditingController();
  final TextEditingController _employeecontroller = TextEditingController();
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
          child: Text('Register as a driver'),
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
                    controller: _licencecontroller,
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
                      labelText: 'Licence Number',
                      hintText: 'enter licence number here',
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: TextFormField(
                    controller: _employeecontroller,
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
                      labelText: 'Employee Number',
                      hintText: 'enter employee number here',
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
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const Password()));
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
