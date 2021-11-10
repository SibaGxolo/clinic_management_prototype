import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  final String buttontext;

  final GestureTapCallback onPressed;
  const Button({
    Key? key,
    required this.buttontext,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      child: Text(buttontext),
      style: ElevatedButton.styleFrom(
        primary: Colors.blue, // background
        onPrimary: Colors.white, // foreground
        fixedSize: const Size(125, 40),
      ),
      onPressed: onPressed,
    );
  }
}
