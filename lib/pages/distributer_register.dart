import 'package:clinic_management_prototype/pages/login.dart';
import 'package:clinic_management_prototype/pages/password.dart';
import 'package:clinic_management_prototype/widgets/button.dart';
import 'package:clinic_management_prototype/widgets/camera.dart';
import 'package:clinic_management_prototype/widgets/inkwell.dart';
import 'package:clinic_management_prototype/widgets/inputfield.dart';
import 'package:flutter/material.dart';

class Distributor extends StatefulWidget {
  const Distributor({Key? key}) : super(key: key);

  @override
  _DistributorState createState() => _DistributorState();
}

class _DistributorState extends State<Distributor> {
  final  _key = GlobalKey<FormState>();

  final TextEditingController _namecontroller = TextEditingController();
  final TextEditingController _surnamecontroller = TextEditingController();
  final TextEditingController _idcontroller = TextEditingController();
  final TextEditingController _employeecontroller = TextEditingController();
  final TextEditingController _addresscontroller = TextEditingController();
  final TextEditingController _cellcontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    var _chosenImage;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Center(
          child: Text('Register as a distributer'),
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
         TextFormField(
                    controller: _namecontroller,
                    validator: (value) {
                      if(value!.isEmpty){
                        return 'field cannot be empty';
                      }else {
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
                      if(value!.isEmpty){
                        return 'field cannot be empty';
                      }else {
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
                      if(value!.isEmpty){
                        return 'field cannot be empty';
                      }else {
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
                    controller: _employeecontroller,
                    validator: (value) {
                      if(value!.isEmpty){
                        return 'field cannot be empty';
                      }else {
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
                TextFormField(
                    controller: _addresscontroller,
                    validator: (value) {
                      if(value!.isEmpty){
                        return 'field cannot be empty';
                      }else {
                        return null;
                      }
                    },
                    obscureText: false,
                    keyboardType: TextInputType.datetime,
                    // ignore: prefer_const_constructors
                    decoration: InputDecoration(
                      labelText: 'Distribution Center Address',
                      hintText: 'enter address here',
                      ),
                      
                  ),
              
                TextFormField(
                    controller: _cellcontroller,
                    validator: (value) {
                      if(value!.isEmpty){
                        return 'field cannot be empty';
                      }else {
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
                          if(_key.currentState!.validate()){
                            return ;
                          }else {
                            Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const Password()));
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
