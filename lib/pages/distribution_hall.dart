import 'package:clinic_management_prototype/pages/complete.dart';

import 'package:clinic_management_prototype/pages/nurse_register.dart';
import 'package:clinic_management_prototype/preferences.dart';
import 'package:clinic_management_prototype/services/auth.dart';

import 'package:clinic_management_prototype/widgets/button.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class DistributionHall extends StatefulWidget {
  const DistributionHall({Key? key}) : super(key: key);

  @override
  State<DistributionHall> createState() => _DistributionHallState();
}

class _DistributionHallState extends State<DistributionHall> {
  final GlobalKey<FormState> _key = GlobalKey<FormState>();

  final TextEditingController _hallnamecontroller = TextEditingController();
  final TextEditingController _halladdresscontroller = TextEditingController();
  final TextEditingController _centercontroller = TextEditingController();
  final TextEditingController _numberofemployeescontroller =
      TextEditingController();
  final TextEditingController _centermanagercontroller =
      TextEditingController();
  final TextEditingController _centermanagernumcontroller =
      TextEditingController();
  final TextEditingController _centermanageremailcontroller =
      TextEditingController();

  late FirebaseAuth _auth;

  bool _isBusyDialogVisible = false;

  @override
  void initState() {
    super.initState();

    _auth = FirebaseAuth.instance;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: const Center(
            child: Text('Register Distribution Hall'),
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
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: TextFormField(
                      decoration: const InputDecoration(
                        labelText: 'Hall',
                        hintText: 'Enter the hall name',
                      ),
                      controller: _hallnamecontroller,
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
                        labelText: 'Hall Address',
                        hintText: 'Enter the hall address',
                      ),
                      controller: _halladdresscontroller,
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
                      controller: _centercontroller,
                      validator: (value) {
                        if (value!.trim().isEmpty) {
                          return 'field cannot be empty';
                        } else if (value.isNotEmpty && value.length < 4) {
                          return 'Center number must contain 4 digits';
                        } else {
                          return null;
                        }
                      },
                      decoration: const InputDecoration(
                        labelText: 'Distribution center number',
                        hintText: 'Enter the distribution center number',
                      ),
                      obscureText: false,
                      keyboardType: TextInputType.phone),
                ),
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: TextFormField(
                      controller: _numberofemployeescontroller,
                      validator: (value) {
                        if (value!.trim().isEmpty) {
                          return 'field cannot be empty';
                        } else if (value.isNotEmpty && value.length < 1) {
                          return 'Number of employee can only be 1 digit number';
                        } else {
                          return null;
                        }
                      },
                      decoration: const InputDecoration(
                        labelText: 'Number of employees',
                        hintText: 'Enter the number of employees',
                      ),
                      obscureText: false,
                      keyboardType: TextInputType.phone),
                ),
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: TextFormField(
                      decoration: const InputDecoration(
                        labelText: 'Distribution center manager name',
                        hintText: 'Enter the name of the center manager ',
                      ),
                      controller: _centermanagercontroller,
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
                        labelText: 'Center manager cell number',
                        hintText: 'Enter the distribution manger cell number',
                      ),
                      controller: _centermanagernumcontroller,
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
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: TextFormField(
                    controller: _centermanageremailcontroller,
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
                      hintText: 'enter center manger email here',
                    ),
                  ),
                ),
                SizedBox(
                  height: (MediaQuery.of(context).size.height * 15) / 100,
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
                                .collection('hall')
                                .doc()
                                .set({
                              'id': Preferences.uid,
                              'name': _hallnamecontroller.text.trim(),
                              'address': _halladdresscontroller.text.trim(),
                              'center number': _centercontroller.text.trim(),
                              'number of employees':
                                  _numberofemployeescontroller.text.trim(),
                              'center manager name':
                                  _centermanagercontroller.text.trim(),
                              'center manager number':
                                  _centermanagernumcontroller.text.trim(),
                              'center manager email':
                                  _centermanageremailcontroller.text.trim(),
                              'userType': 'nurse',
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
