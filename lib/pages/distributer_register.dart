import 'dart:io';
import 'package:clinic_management_prototype/pages/complete.dart';
import 'package:clinic_management_prototype/pages/login.dart';
import 'package:clinic_management_prototype/services/auth.dart';

import 'package:clinic_management_prototype/widgets/button.dart';
import 'package:clinic_management_prototype/widgets/camera.dart';
import 'package:clinic_management_prototype/widgets/inkwell.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_progress_hud/flutter_progress_hud.dart';
import 'package:image_picker/image_picker.dart';

class Distributor extends StatefulWidget {
  const Distributor({Key? key}) : super(key: key);

  @override
  _DistributorState createState() => _DistributorState();
}

class _DistributorState extends State<Distributor> {
  final _key = GlobalKey<FormState>(debugLabel: '_RegisterScreenState');

  final GlobalKey _safeArea = GlobalKey();

  final TextEditingController _namecontroller = TextEditingController();
  final TextEditingController _surnamecontroller = TextEditingController();
  final TextEditingController _idcontroller = TextEditingController();
  final TextEditingController _employeecontroller = TextEditingController();
  final TextEditingController _emailcontroller = TextEditingController();
  final TextEditingController _passwordcontroller = TextEditingController();

  final TextEditingController _cellcontroller = TextEditingController();
  dynamic _chosenImage;

  late FocusNode myFocusNode;

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

  void _remove() {
    setState(() {
      _chosenImage = null;
    });
  }

  @override
  void initState() {
    super.initState();
    Firebase.initializeApp();
    myFocusNode = FocusNode();
  }

  @override
  void dispose() {
    super.dispose();
    // Clean up the focus node when the Form is disposed.
    myFocusNode.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ProgressHUD(
      child: SafeArea(
        key: _safeArea,
        child: Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            title: const Center(
              child: Text('Register as a distributer'),
            ),
            automaticallyImplyLeading: false,
          ),
          body: SingleChildScrollView(
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
                        if (value!.trim().isEmpty) {
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
                        if (value!.trim().isEmpty) {
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
                        if (value!.trim().isEmpty) {
                          return 'field cannot be empty';
                        } else if (value.isNotEmpty && value.length < 13) {
                          return 'ID Number must contain 13 digits';
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
                      controller: _employeecontroller,
                      validator: (value) {
                        if (value!.trim().isEmpty) {
                          return 'field cannot be empty';
                        } else if (value.isNotEmpty && value.length < 4) {
                          return 'ID Number must contain 4 digits';
                        } else {
                          return null;
                        }
                      },
                      obscureText: false,
                      keyboardType: TextInputType.number,
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
                      controller: _emailcontroller,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'field cant be empty';
                        }
                        if (!RegExp(r'\S+@\S+\.\S+').hasMatch(value)) {
                          return 'Enter a valid email address';
                        }
                      },
                      obscureText: false,
                      keyboardType: TextInputType.datetime,
                      // ignore: prefer_const_constructors
                      decoration: InputDecoration(
                        labelText: 'Email',
                        hintText: 'enter your email here',
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: TextFormField(
                      controller: _cellcontroller,
                      validator: (value) {
                        if (value!.trim().isEmpty) {
                          return 'field cannot be empty';
                        } else if (value.isNotEmpty && value.length < 10) {
                          return 'Cell number must contain 10 digits';
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
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: TextFormField(
                      controller: _passwordcontroller,
                      validator: (value) {
                        if (value!.trim().isEmpty) {
                          return 'field cannot be empty';
                        } else if (!RegExp(
                                r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$')
                            .hasMatch(value)) {
                          return 'Enter a strong password';
                        } else {
                          return null;
                        }
                      },
                      obscureText: false,
                      keyboardType: TextInputType.text,
                      // ignore: prefer_const_constructors
                      decoration: InputDecoration(
                        labelText: 'Enter your password',
                        hintText: 'enter password here',
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
                            SystemChannels.textInput
                                .invokeMethod('TextInput.hide');

                            if (!_key.currentState!.validate()) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                      content:
                                          Text('Enter all fields to proceed')));
                            } else {
                              final progress =
                                  ProgressHUD.of(_safeArea.currentContext!);
                              progress!.show();
                              AuthService()
                                  .signUp(
                                _namecontroller.text.trim(),
                                _surnamecontroller.text.trim(),
                                _idcontroller.text.trim(),
                                _cellcontroller.text.trim(),
                                _employeecontroller.text.trim(),
                                _emailcontroller.text.trim(),
                                _passwordcontroller.text.trim(),
                              )
                                  .whenComplete(() {
                                progress.dismiss();
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const Complete()));
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
      ),
    );
  }
}
