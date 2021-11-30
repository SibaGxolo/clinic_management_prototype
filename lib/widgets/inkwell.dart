import 'package:flutter/material.dart';

class InkWeLL extends StatelessWidget {
  final IconData icon;
  final String text;
  final GestureTapCallback onTaped;
  const InkWeLL({
    required this.icon,
    required this.text,
    required this.onTaped,
    //ontaped
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTaped,
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
