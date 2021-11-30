import 'package:clinic_management_prototype/pages/login.dart';
import 'package:clinic_management_prototype/pages/patient_register.dart';
import 'package:clinic_management_prototype/preferences.dart';
import 'package:clinic_management_prototype/services/auth.dart';
import 'package:clinic_management_prototype/widgets/button.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Proxy extends StatefulWidget {
  const Proxy({Key? key}) : super(key: key);

  @override
  _ProxyState createState() => _ProxyState();
}

class _ProxyState extends State<Proxy> {
  final _key = GlobalKey<FormState>();

  final TextEditingController _namecontroller = TextEditingController();
  final TextEditingController _surnamecontroller = TextEditingController();
  final TextEditingController _idcontroller = TextEditingController();
  final TextEditingController _cardcontroller = TextEditingController();
  final TextEditingController _collectioncontroller = TextEditingController();
  final TextEditingController _cellphonecontroller = TextEditingController();
  final TextEditingController _emailcontroller = TextEditingController();

  late FirebaseAuth _auth;

  bool _isBusyDialogVisible = false;

  @override
  void initState() {
    super.initState();

    _auth = FirebaseAuth.instance;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Center(
          child: Text('Register a proxy'),
        ),
        automaticallyImplyLeading: false,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: (MediaQuery.of(context).size.height * 2.5) / 100,
              ),
              Padding(
                padding: const EdgeInsets.all(10),
                child: TextFormField(
                    decoration: const InputDecoration(
                      labelText: 'Proxy name',
                      hintText: 'Enter your proxy name',
                    ),
                    controller: _namecontroller,
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
                    obscureText: false,
                    keyboardType: TextInputType.text),
              ),
              Padding(
                padding: const EdgeInsets.all(10),
                child: TextFormField(
                    controller: _idcontroller,
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
                      hintText: 'Enter the patients medication collection day',
                    ),
                    controller: _collectioncontroller,
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
                        // final progress = ProgressHUD.of(context);
                        //
                        // setState(() {
                        //   progress!.show();
                        // });

                        await FirebaseFirestore.instance
                            .collection("users")
                            .doc(Preferences.uid)
                            .collection('proxies')
                            .doc()
                            .set({
                          'id': Preferences.uid,
                          'email': _emailcontroller.text.trim(),
                          'name': _namecontroller.text.trim(),
                          'surname': _surnamecontroller.text.trim(),
                          'patientCardNumber': _cardcontroller.text.trim(),
                          'collectionDay': _collectioncontroller.text.trim(),
                          'cellphoneNumber': _cellphonecontroller.text.trim(),
                          'userType': 'patient',
                        });

                        // if(_key.currentState!.validate()){
                        //   ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Enter all fields to proceed')));
                        //
                        // }else{
                        //
                        //   await FirebaseFirestore.instance.collection("users").doc(Preferences.uid).collection('proxies').doc().set({
                        //     'id': Preferences.uid,
                        //     'email': _emailcontroller.text.trim(),
                        //     'name': _namecontroller.text.trim(),
                        //     'surname': _surnamecontroller.text.trim(),
                        //     'patientCardNumber': _cardcontroller.text.trim(),
                        //     'collectionDay': _collectioncontroller.text.trim(),
                        //     'cellphoneNumber': _cellphonecontroller.text.trim(),
                        //     'userType' : 'patient',
                        //   });
                        //
                        // }

                        // setState(() {
                        //   progress!.dismiss();
                        // });

                        AuthService(_auth).signOut().then((value) {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const Login()));
                        });
                      }),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
