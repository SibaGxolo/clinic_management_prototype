// ignore_for_file: prefer_const_constructors

import 'package:clinic_management_prototype/pages/login.dart';
import 'package:clinic_management_prototype/pages/password.dart';
import 'package:clinic_management_prototype/pages/proxy_register.dart';
import 'package:clinic_management_prototype/pages/register.dart';
import 'package:clinic_management_prototype/widgets/button.dart';
import 'package:clinic_management_prototype/widgets/inputfield.dart';
import 'package:flutter/material.dart';

class Patient extends StatefulWidget {
  const Patient({ Key? key }) : super(key: key);

  @override
  _PatientState createState() => _PatientState();
}

class _PatientState extends State<Patient> {
  @override
  Widget build(BuildContext context) {
      var _chosenImage;
      return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Center(
          child: Text('Register as a patient'),
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
                      margin: EdgeInsets.symmetric(vertical: 30, horizontal: 30),
                      child: CircleAvatar(
                        radius: 65,
                        backgroundColor: Colors.blueAccent,
                        child: CircleAvatar(
                          radius: 65,
                          backgroundImage: _chosenImage == null 
                          ?null : FileImage(_chosenImage),
                        ),
                        
                      ),
                    ),
                    Positioned(
                      top: 120,
                      left: 110,
                      child: RawMaterialButton(
                        elevation: 10,
                        fillColor: Colors.blueAccent,
                        child: Icon(Icons.add_a_photo),
                        padding: EdgeInsets.all(15.0),
                        shape: CircleBorder(),
                        onPressed: () {
                          showDialog(context: context,
                          builder: (BuildContext context){
                            return AlertDialog(title: Text('Choose option to upload ID photo',
                            style: TextStyle(fontWeight: FontWeight.w500,
                            color: Colors.blueAccent,
                            ),
                            ),
                            content: SingleChildScrollView(
                              child: ListBody(
                              children: [
                                InkWell(
                                onTap: () {},
                                splashColor: Colors.purpleAccent,
                                child: Row(
                                  children: [
                                 Padding(
                                   padding: const EdgeInsets.all(8.0),
                                   child: Icon(Icons.camera,
                                   color: Colors.purpleAccent,
                                   ),
                                 ), 
                                 Text('Camera', style: TextStyle(
                                   fontSize: 18,
                                   fontWeight: FontWeight.w500,
                                 color: Colors.black,

                                  ),
                                  )

                                ],
                                ),
                                ),

                                InkWell(
                                onTap: () {},
                                splashColor: Colors.purpleAccent,
                                child: Row(
                                  children: [
                                 Padding(
                                   padding: const EdgeInsets.all(8.0),
                                   child: Icon(Icons.image,
                                   color: Colors.purpleAccent,
                                   ),
                                 ), 
                                 Text('Gallery', style: TextStyle(
                                   fontSize: 18,
                                   fontWeight: FontWeight.w500,
                                 color: Colors.black,

                                  ),
                                  )

                                ],
                                ),
                                ),

                                InkWell(
                                onTap: () {},
                                splashColor: Colors.purpleAccent,
                                child: Row(
                                  children: [
                                 Padding(
                                   padding: const EdgeInsets.all(8.0),
                                   child: Icon(Icons.remove_circle,
                                   color: Colors.purpleAccent,
                                   ),
                                 ), 
                                 Text('Remove', style: TextStyle(
                                   fontSize: 18,
                                   fontWeight: FontWeight.w500,
                                 color: Colors.black,

                                  ),
                                  )

                                ],
                                ),
                                ),
                              ],
                              ),
                            ),
                            );
                          });
                        }
                      ),
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
                  labelText: 'Clinic card number',
                  hintText: 'Enter the clinic card number',
                  obscureText: false,
                  textinputtype: TextInputType.phone),
              const InputField(
                  labelText: 'Medication collection day',
                  hintText: 'Enter the day of the month',
                  obscureText: false,
                  textinputtype: TextInputType.text),
              const InputField(
                  labelText: 'Address',
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
                                builder: (context) => const Login())); //testing home page
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
                                  'Would you like to register a proxy?',
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
                                                          const Proxy()));
                                            },
                                            textbutton: 'Yes'),
                                        UserChoice(
                                            onPressed: () {
                                              Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          const Password()));
                                            },
                                            textbutton: 'No'),
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
