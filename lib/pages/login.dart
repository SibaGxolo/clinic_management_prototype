import 'package:clinic_management_prototype/pages/home_page.dart';
import 'package:clinic_management_prototype/pages/register.dart';
import 'package:clinic_management_prototype/services/auth.dart';
import 'package:clinic_management_prototype/widgets/button.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final _key = GlobalKey<FormState>();

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
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Center(
          child: Text('Login'),
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
                            onPressed: () {
                              // final progress = ProgressHUD.of(context);
                              //
                              // setState(() {
                              //   progress!.show();
                              // });

                              AuthService(_auth)
                                  .login(_emailController.text.trim(),
                                      _passwordController.text.trim())
                                  .then((user) {
                                // setState(() {
                                //   progress!.dismiss();
                                // });

                                Navigator.push(
                                    context,
                                    //Login button redirects the app to the landing page
                                    MaterialPageRoute(
                                        builder: (context) => const Home()));
                              });
                              // if (_key.currentState!.validate()) {
                              // } else {}
                              // {
                              //
                              //
                              // }
                            }),
                        SizedBox(
                          height:
                              (MediaQuery.of(context).size.height * 2.5) / 100,
                        ),
                        Button(
                            buttontext: 'Register',
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const Register()));
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
    );
  }
}
