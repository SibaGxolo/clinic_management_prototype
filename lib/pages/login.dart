import 'package:clinic_management_prototype/pages/home_page.dart';
import 'package:clinic_management_prototype/pages/register.dart';
import 'package:clinic_management_prototype/services/auth.dart';
import 'package:clinic_management_prototype/widgets/button.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_progress_hud/flutter_progress_hud.dart';
import 'package:google_fonts/google_fonts.dart';

//This class is solely for login purposes. It is in line with the firebase authentication, to capture the relevant validations
//and to capture the information entered into the firebase
class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final _key = GlobalKey<FormState>();

  final GlobalKey _safeArea = GlobalKey();

  @override
  void initState() {
    super.initState();
    Firebase.initializeApp();
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
              child: Text('Login'),
            ),
            automaticallyImplyLeading: false,
          ),
          body: SingleChildScrollView(
            child: Form(
              key: _key,
              child: Column(
                children: [
                  SizedBox(
                    height: (MediaQuery.of(context).size.height * 7.5) / 100,
                  ),
                  Text(
                    'Clinic Management',
                    style: GoogleFonts.lato(
                      color: Colors.blue,
                      fontWeight: FontWeight.w700,
                      fontSize: 35,
                    ),
                  ),
                  SizedBox(
                    height: (MediaQuery.of(context).size.height * 7.5) / 100,
                  ),
                  // ignore: prefer_const_constructors
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: TextFormField(
                      controller: _emailController,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'username cannot be empty';
                        } else {
                          return null;
                        }
                      },
                      keyboardType: TextInputType.text,
                      // ignore: prefer_const_constructors
                      decoration: InputDecoration(
                        labelText: 'Email',
                        hintText: 'enter email here',
                      ),
                    ),
                  ),

                  // ignore: prefer_const_constructors
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: TextFormField(
                      controller: _passwordController,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Password cannot be empty';
                        } else {
                          return null;
                        }
                      },
                      obscureText: true,
                      keyboardType: TextInputType.text,
                      // ignore: prefer_const_constructors
                      decoration: InputDecoration(
                        labelText: 'Password',
                        hintText: 'enter password here',
                      ),
                    ),
                  ),
                  ButtonBar(
                    alignment: MainAxisAlignment.end,
                    children: [
                      Column(
                        children: [
                          Button(
                              buttontext: 'Login',
                              onPressed: () async {
                                SystemChannels.textInput
                                    .invokeMethod('TextInput.hide');

                                if (!_key.currentState!.validate()) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                          content: Text(
                                              'Enter all fields to proceed')));
                                } else {
                                  final progress =
                                      ProgressHUD.of(_safeArea.currentContext!);
                                  progress!.show();

                                  AuthService()
                                      .login(_emailController.text.trim(),
                                          _passwordController.text.trim())
                                      .then((user) {
                                    progress.dismiss();
                                    if (user.toLowerCase().contains('failed')) {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(const SnackBar(
                                              content: Text(
                                                  'Email or password is incorrect')));
                                    } else {
                                      Navigator.push(
                                          context,
                                          //Login button redirects the app to the landing page
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  const Home()));
                                    }
                                  });
                                }
                              }),
                          SizedBox(
                            height: (MediaQuery.of(context).size.height * 2.5) /
                                100,
                          ),
                          Button(
                              buttontext: 'Register',
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const Register()));
                              }),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(
                    height: (MediaQuery.of(context).size.height * 18) / 100,
                  ),
                  TextButton(
                    onPressed: () {},
                    child: const Align(
                      alignment: Alignment.bottomCenter,
                      child: Text(
                        "Forgot your password",
                        style: TextStyle(fontSize: 20.0),
                      ),
                    ),
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
