import 'package:flutter/material.dart';

class InkWeLL extends StatelessWidget {
  final IconData icon;
  final String text;
  final GestureTapCallback onTapped;
  const InkWeLL({
    required this.icon,
    required this.text,
    required this.onTapped,
    //ontaped
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTapped,
      splashColor: Colors.purpleAccent,
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Icon(
              icon,
              color: Colors.purpleAccent,
            ),
          ),
          Text(
            text,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w500,
              color: Colors.black,
            ),
          )
        ],
      ),
    );
  }
}
