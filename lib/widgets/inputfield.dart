// ignore_for_file: prefer_const_constructors, file_names

import 'package:flutter/material.dart';

class InputField extends StatelessWidget {
  final String labelText;
  final String hintText;
  final bool obscureText;
  final TextInputType textinputtype;

  const InputField({
    Key? key,
    required this.labelText,
    required this.hintText,
    required this.obscureText,
    required this.textinputtype,
  }) : super(
          key: key,
        );

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: TextField(
        style: TextStyle(
          color: Colors.blue,
        ),
        cursorColor: Colors.blue,
        keyboardType: TextInputType.text,
        decoration: InputDecoration(
          labelStyle: TextStyle(
            color: Colors.blue,
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(width: 2, color: Colors.blue),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              width: 1,
              color: Colors.blue,
            ),
          ),
          labelText: labelText,
          hintText: hintText,
        ),
      ),
    );
  }
}
