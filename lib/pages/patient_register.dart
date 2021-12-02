import 'dart:io';

import 'package:clinic_management_prototype/pages/home_page.dart';
import 'package:clinic_management_prototype/pages/login.dart';
import 'package:clinic_management_prototype/pages/proxy_register.dart';
import 'package:clinic_management_prototype/pages/register.dart';
import 'package:clinic_management_prototype/services/auth.dart';
import 'package:clinic_management_prototype/widgets/button.dart';
import 'package:clinic_management_prototype/widgets/camera.dart';
import 'package:clinic_management_prototype/widgets/inkwell.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

// class Patient extends StatefulWidget {
//   const Patient({Key? key}) : super(key: key);
//
//   @override
//   _PatientState createState() => _PatientState();
// }
//
// class _PatientState extends State<Patient> {
//
// }

class Patient extends StatefulWidget {
  const Patient({Key? key}) : super(key: key);

  @override
  _PatientState createState() => _PatientState();
}

class _PatientState extends State<Patient> {
  final GlobalKey<FormState> _key = GlobalKey<FormState>();

  final TextEditingController _namecontroller = TextEditingController();
  final TextEditingController _surnamecontroller = TextEditingController();
  final TextEditingController _idcontroller = TextEditingController();
  final TextEditingController _cardcontroller = TextEditingController();
  final TextEditingController _collectioncontroller = TextEditingController();
  final TextEditingController _addresscontroller = TextEditingController();
  final TextEditingController _cellcontroller = TextEditingController();
  final TextEditingController _emailcontroller = TextEditingController();
  final TextEditingController _passwordcontroller = TextEditingController();

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

  void _remove() {
    setState(() {
      _chosenImage = null;
    });
  }

  late FirebaseAuth _auth;

  bool _isBusyDialogVisible = false;

  @override
  void initState() {
    super.initState();
    Firebase.initializeApp().then((value) {
      _auth = FirebaseAuth.instance;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: const Center(
            child: Text('Register as a patient'),
          ),
          automaticallyImplyLeading: false,
        ),
        body: SingleChildScrollView(
          child: Form(
            key: _key,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
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
                        } 
                        
                        else {
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
                        } 
                        else if(value.isNotEmpty && value.length<13)
                        {
                          return 'ID Number must contain 13 digits';
                        }
                        else {
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
                      controller: _cardcontroller,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'field cannot be empty';
                        }
                        else if(value.isNotEmpty && value.length<8)
                        {
                          return 'Clinic card number must contain 8 digits';
                        } 
                        else {
                          return null;
                        }
                      },
                      obscureText: false,
                      keyboardType: TextInputType.number,
                      // ignore: prefer_const_constructors
                      decoration: InputDecoration(
                        labelText: 'Clinic Card Number',
                        hintText: 'enter clinic card number here',
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: TextFormField(
                      controller: _collectioncontroller,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'field cannot be empty';
                        } else {
                          return null;
                        }
                      },
                      obscureText: false,
                      keyboardType: TextInputType.datetime,
                      // ignore: prefer_const_constructors
                      decoration: InputDecoration(
                        labelText: 'Medication Collection Day',
                        hintText: 'enter day of the month here',
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: TextFormField(
                      controller: _addresscontroller,
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
                        labelText: 'Address',
                        hintText: 'enter enter address here',
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: TextFormField(
                      controller: _cardcontroller,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'field cannot be empty';
                        }
                        else if(value.isNotEmpty && value.length<8)
                        {
                          return 'Clinic card number must contain 8 digits';
                        } 
                        else {
                          return null;
                        }
                      },
                      obscureText: false,
                      keyboardType: TextInputType.number,
                      // ignore: prefer_const_constructors
                      decoration: InputDecoration(
                        labelText: 'Clinic Card Number',
                        hintText: 'enter clinic card number here',
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
                        }else if(value.isNotEmpty && value.length<10)
                        {
                          return 'Cellphone number must contain 10 digits';
                        }  
                        else {
                          return null;
                        }
                      },
                      obscureText: false,
                      keyboardType: TextInputType.phone,
                      // ignore: prefer_const_constructors
                      decoration: InputDecoration(
                        labelText: 'Cellphone Number',
                        hintText: 'enter clinic card number here',
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: TextFormField(
                      controller: _emailcontroller,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'field cannot be empty';
                        } 
                        else {
                          return null;
                        }
                      },
                      obscureText: false,
                      keyboardType: TextInputType.phone,
                      // ignore: prefer_const_constructors
                      decoration: InputDecoration(
                        labelText: 'Enter your email',
                        hintText: 'enter email here',
                      ),
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: TextFormField(
                      controller: _passwordcontroller,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'field cannot be empty';
                        } 
                        else if(value.isNotEmpty && value.length<8)
                        {
                          return 'Password must contain 8 digits';
                        }
                        else {
                          return null;
                        }
                      },
                      obscureText: false,
                      keyboardType: TextInputType.phone,
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
                            AuthService(_auth)
                                .signUp(
                              _emailcontroller.text.trim(),
                              _passwordcontroller.text.trim(),
                            )
                                .then((value) async {
                              User? user = FirebaseAuth.instance.currentUser;

                              await FirebaseFirestore.instance
                                  .collection("users")
                                  .doc(user!.uid)
                                  .set({
                                'uid': user.uid,
                                'email': _emailcontroller.text.trim(),
                                'name': _namecontroller.text.trim(),
                                'surname': _surnamecontroller.text.trim(),
                                'idNumber': _idcontroller.text.trim(),
                                'cardNumber': _cardcontroller.text.trim(),
                                'collectionDay':
                                    _collectioncontroller.text.trim(),
                                'password': _passwordcontroller.text.trim(),
                              });
                            });

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
                                      'Would you like to register a proxy?',
                                      textAlign: TextAlign.center,
                                    )),
                                    actions: [
                                      ButtonBar(
                                          alignment:
                                              MainAxisAlignment.spaceAround,
                                          children: [
                                            UserChoice(
                                                onPressed: () {
                                                  // final progress = ProgressHUD.of(context);
                                                  //
                                                  // setState(() {
                                                  //
                                                  //   progress!.show();
                                                  // });

                                                  // setState(() {
                                                  //   progress!.dismiss();
                                                  // });
                                                  Navigator.push(
                                                      context,
                                                      MaterialPageRoute(
                                                          builder: (context) =>
                                                              const Proxy()));
                                                },
                                                textbutton: 'Yes'),
                                            UserChoice(
                                                onPressed: () {
                                                  Navigator.push(
                                                      context,
                                                      MaterialPageRoute(
                                                          builder: (context) =>
                                                              const Home()));
                                                },
                                                textbutton: 'No'),
                                          ])
                                    ],
                                  );
                                });

                            // if (_key.currentState!.validate()) {
                            //   ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Enter all fields to proceed')));
                            // } else {
                            //
                            // }
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
