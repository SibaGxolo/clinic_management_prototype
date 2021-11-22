import 'package:clinic_management_prototype/widgets/defaults.dart';
import 'package:clinic_management_prototype/pages/icon_home.dart';
import 'package:clinic_management_prototype/pages/icon_notifications.dart';
import 'package:clinic_management_prototype/pages/icon_profile.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Center(
          child: Text(
            'Home',
          ),
        ),
        automaticallyImplyLeading: false,
      ),

      body: Center(
        child: Column(
          children: [
            const SizedBox(
              height: 100,
            ),
            Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
              //picture needs to be clickable
              Container(
                width: 180,
                height: 140,
                padding: const EdgeInsets.all(10),
                margin: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  border: Border.all(
                    width: 2,
                  ),
                ),
                child: Column(
                  children: [
                    Image.asset(
                      'assets/checkup.jpg',
                      width: 100,
                      height: 75,
                    ),
                    Text('Check up /\n Follow Up',
                        textAlign: TextAlign.center,
                        style: GoogleFonts.lato(
                          color: Colors.blue,
                          fontWeight: FontWeight.w700,
                          fontSize: 15,
                        )),
                  ],
                ),
              ),

              //picture needs to be clickable
              Container(
                width: 180,
                height: 140,
                padding: const EdgeInsets.all(10),
                margin: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  border: Border.all(
                    width: 2,
                  ),
                ),
                child: Column(
                  children: [
                    Image.asset(
                      'assets/medicalemergancy.jpg',
                      width: 100,
                      height: 75,
                    ),
                    Text(
                      'Sick /\n Medical Emergancy',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.lato(
                        color: Colors.blue,
                        fontWeight: FontWeight.w700,
                        fontSize: 15,
                      ),
                    ),
                  ],
                ),
              ),
            ]),

            const SizedBox(
              height: 75,
            ),
            //picture needs to be clickable
            Container(
              width: 180,
              height: 140,
              padding: const EdgeInsets.all(10),
              margin: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                border: Border.all(
                  width: 2,
                ),
              ),
              child: Column(
                children: [
                  Image.asset(
                    'assets/medication.jpg',
                    width: 100,
                    height: 75,
                  ),
                  Text('Medication Delivery',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.lato(
                        color: Colors.blue,
                        fontWeight: FontWeight.w700,
                        fontSize: 15,
                      )),
                ],
              ),
            ),

            const SizedBox(
              height: 50,
            ),
          ],
        ),
      ),

      //Bottom Navigation Code

      bottomNavigationBar: BottomNavigationBar(
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
        onTap: (value) {
          setState(() {
            _indexClicked = value;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: ('Home'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications),
            label: ('Notifications'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: ('Profile'),
          ),
        ],
      ),
    );
  }
}

//User choice button methods with variables
class UserChoice extends StatelessWidget {
  final GestureTapCallback onPressed;
  final String textbutton;

  const UserChoice({
    Key? key,
    required this.onPressed,
    required this.textbutton,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: Text(
        textbutton,
        style: GoogleFonts.lato(
          color: Colors.blue,
          fontWeight: FontWeight.w700,
          fontSize: 15,
        ),
      ),
    );
  }
}
