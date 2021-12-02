import 'package:clinic_management_prototype/widgets/defaults.dart';
import 'package:clinic_management_prototype/pages/icon_home.dart';
import 'package:clinic_management_prototype/pages/icon_notifications.dart';
import 'package:clinic_management_prototype/pages/icon_profile.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
        child: Scaffold(
      //Bottom Navigation Code
      bottomNavigationBar: MyBottomNavigationBar(),
    ));
  }
}

//Option 2
class MyBottomNavigationBar extends StatefulWidget {
  const MyBottomNavigationBar({Key? key}) : super(key: key); //note

  @override
  _MyBottomNavigationBarState createState() => _MyBottomNavigationBarState();
}

class _MyBottomNavigationBarState extends State<MyBottomNavigationBar> {
  int _indexClicked = 0; //Index is clicked at position 0
  final List<Widget> _children = [
    const IconHome(),
    const IconNotifications(),
    const IconProfile()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _children[_indexClicked],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.blue[100],
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Defaults.bottomNavSelectedColor,
        unselectedItemColor: Defaults.bottomNavItemColor,
        currentIndex: _indexClicked,
        onTap: (int value) {
          setState(() {
            _indexClicked = value;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Defaults.bottomNavItemIcon[0],
            ),
            label: Defaults.bottomNavItemText[0],
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Defaults.bottomNavItemIcon[1],
            ),
            label: Defaults.bottomNavItemText[1],
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Defaults.bottomNavItemIcon[2],
            ),
            label: Defaults.bottomNavItemText[2],
          ),
        ],
      ),
    );
  }
}

//User choice button methods with variables
// class UserChoice extends StatelessWidget {
//   final GestureTapCallback onPressed;
//   final String textbutton;
//
//   const UserChoice({
//     Key? key,
//     required this.onPressed,
//     required this.textbutton,
//   }) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return TextButton(
//       onPressed: onPressed,
//       child: Text(
//         textbutton,
//         style: GoogleFonts.lato(
//           color: Colors.blue,
//           fontWeight: FontWeight.w700,
//           fontSize: 15,
//         ),
//       ),
//     );
//   }
// }
