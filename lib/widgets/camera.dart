import 'package:flutter/material.dart';

class Camera extends StatelessWidget {
  final IconData icon;
  final GestureTapCallback onPressed;
  const Camera({
    Key? key,
    required this.icon,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      elevation: 10,
      fillColor: Colors.blueAccent,
      child: Icon(icon),
      padding: const EdgeInsets.all(15.0),
      shape: const CircleBorder(),
      onPressed: onPressed,
    );
  }
}
