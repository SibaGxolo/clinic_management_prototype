import 'dart:io';
import 'package:clinic_management_prototype/pages/complete.dart';
import 'package:clinic_management_prototype/pages/login.dart';
import 'package:clinic_management_prototype/pages/patient_register.dart';
import 'package:clinic_management_prototype/preferences.dart';
import 'package:clinic_management_prototype/services/auth.dart';
import 'package:clinic_management_prototype/widgets/button.dart';
import 'package:clinic_management_prototype/widgets/camera.dart';
import 'package:clinic_management_prototype/widgets/inkwell.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class Proxy extends StatefulWidget {
  const Proxy({Key? key}) : super(key: key);

  @override
  _ProxyState createState() => _ProxyState();
}

class _ProxyState extends State<Proxy> {
  final GlobalKey<FormState> _key = GlobalKey<FormState>();

  final TextEditingController _namecontroller = TextEditingController();
  final TextEditingController _surnamecontroller = TextEditingController();
  final TextEditingController _idcontroller = TextEditingController();
  final TextEditingController _cardcontroller = TextEditingController();
  final TextEditingController _collectioncontroller = TextEditingController();
  final TextEditingController _cellphonecontroller = TextEditingController();
  final TextEditingController _emailcontroller = TextEditingController();

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

  // late String cardNumber;

  @override
  void initState() {
    super.initState();

    _auth = FirebaseAuth.instance;

    // getUserDetails(Preferences.uid!).then((user) {
    //   cardNumber = user.cardNumber;
    //  });
  }

  @override
  Widget build(BuildContext context) {
    // getUserDetails(Preferences.uid!).then((user) {
    //  cardNumber = user.cardNumber;
    // });

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: const Center(
            child: Text('Register a proxy'),
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
                                          onTapped: _chosenImageCamera,
                                        ),
                                        InkWeLL(
                                          icon: Icons.image,
                                          text: 'Gallery',
                                          onTapped: _chosenImageGallery,
                                        ),
                                        InkWeLL(
                                          icon: Icons.remove_circle,
                                          text: 'Remove',
                                          onTapped: _remove,
                                        ),
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
                      decoration: const InputDecoration(
                        labelText: 'Proxy name',
                        hintText: 'Enter your proxy name',
                      ),
                      controller: _namecontroller,
                      validator: (value) {
                        if (value!.trim().isEmpty) {
                          return 'field cannot be empty';
                        } else {
                          return null;
                        }
                      },
                      obscureText: false,
                      keyboardType: TextInputType.text),
                ),
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: TextFormField(
                      decoration: const InputDecoration(
                        labelText: 'Proxy surname',
                        hintText: 'Enter your proxy surname',
                      ),
                      controller: _surnamecontroller,
                      validator: (value) {
                        if (value!.trim().isEmpty) {
                          return 'field cannot be empty';
                        } else {
                          return null;
                        }
                      },
                      obscureText: false,
                      keyboardType: TextInputType.text),
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
                      decoration: const InputDecoration(
                        labelText: 'Proxy ID number',
                        hintText: 'Enter your proxy ID number',
                      ),
                      obscureText: false,
                      keyboardType: TextInputType.phone),
                ),
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: TextFormField(
                      validator: (value) {
                        if (value!.trim().isEmpty) {
                          return "Card number invalid";
                        } else {
                          return null;
                        }
                      },
                      decoration: const InputDecoration(
                        labelText: 'patient clinic card number ',
                        hintText: 'Enter the patients clinic card number',
                      ),
                      controller: _cardcontroller,
                      obscureText: false,
                      keyboardType: TextInputType.phone),
                ),
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: TextFormField(
                      decoration: const InputDecoration(
                        labelText: 'Medication collection day',
                        hintText:
                            'Enter the patients medication collection day',
                      ),
                      controller: _collectioncontroller,
                      validator: (value) {
                        if (value!.trim().isEmpty) {
                          return 'field cannot be empty';
                        } else {
                          return null;
                        }
                      },
                      obscureText: false,
                      keyboardType: TextInputType.text),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                      decoration: const InputDecoration(
                        labelText: 'Proxy Cell Phone',
                        hintText: 'Enter your proxy cell number',
                      ),
                      controller: _cellphonecontroller,
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
                      keyboardType: TextInputType.phone),
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
                                  builder: (context) => const Patient()));
                        }),
                    Button(
                        buttontext: 'Proceed',
                        onPressed: () async {
                          if (!_key.currentState!.validate()) {
                            ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                    content:
                                        Text('Enter all fields to proceed')));
                          } else {
                            await FirebaseFirestore.instance
                                .collection("users")
                                .doc(Preferences.uid)
                                .collection('proxies')
                                .doc()
                                .set({
                              'id': Preferences.uid,
                              'name': _namecontroller.text.trim(),
                              'surname': _surnamecontroller.text.trim(),
                              'patientCardNumber': _cardcontroller.text.trim(),
                              'collectionDay':
                                  _collectioncontroller.text.trim(),
                              'cellphoneNumber':
                                  _cellphonecontroller.text.trim(),
                              'userType': 'patient',
                            });
                          }

                          AuthService().signOut().then((value) {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const Complete()));
                          });
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
