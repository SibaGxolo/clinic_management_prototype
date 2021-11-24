import 'package:clinic_management_prototype/pages/home_page.dart';
import 'package:clinic_management_prototype/pages/register.dart';
import 'package:clinic_management_prototype/widgets/button.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final _key = GlobalKey<FormState>();

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
                const SizedBox(
                  height: 25,
                ),
                Text(
                  'Clinic Management',
                  style: GoogleFonts.lato(
                    color: Colors.blue,
                    fontWeight: FontWeight.w700,
                    fontSize: 35,
                  ),
                ),
                const SizedBox(height: 25),
                // ignore: prefer_const_constructors
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: TextFormField(
                    controller: _usernameController,
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
                      labelText: 'Username',
                      hintText: 'enter username here',
                    ),
                  ),
                ),

                // ignore: prefer_const_constructors
                Padding(
                  padding: const EdgeInsets.all(8.0),
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
                              if (_key.currentState!.validate()) {
                              } else {}
                              {
                                Navigator.push(
                                    context,
                                    //Login button redirects the app to the landing page
                                    MaterialPageRoute(
                                        builder: (context) => const Home()));
                              }
                            }),
                        const SizedBox(height: 10),
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
                const SizedBox(height: 130),
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
