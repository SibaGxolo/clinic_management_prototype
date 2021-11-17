import 'package:clinic_management_prototype/defaults.dart';
import 'package:clinic_management_prototype/pages/icon_home.dart';
import 'package:clinic_management_prototype/pages/icon_notifications.dart';
import 'package:clinic_management_prototype/pages/icon_profile.dart';
import 'package:clinic_management_prototype/pages/medical_emergancy.dart';
import 'package:clinic_management_prototype/pages/medication_delivery.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'check_up.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

   @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Center(
          child: Text('Home',),
          
        ),
      ),
     
     body: ListView(
      
      children: [
         SizedBox(
            height: 50,
          ),
         Image.asset('assets/checkup.jpg',
          width:200,
        height: 150,),

        //Button for Check up
      UserChoice(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => CheckUp()));
              },
              textbutton: 'Check Up / Follow Up',),
       SizedBox(
            height: 50,
          ),
        Image.asset('assets/medicalemergancy.jpg',
        width:200,
        height: 150,) ,

          //Button for Medical Emergancy
           UserChoice(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => MedicalEmergancy()));
              },
              textbutton: 'Sick / Medical Emergancy'),
         SizedBox(
            height: 40,
          ),
        Image.asset('assets/medication.jpg',
         width:200,
        height: 150),
         SizedBox(
            height: 5,
            ),
          
          //Button for Medical Emergancy
         UserChoice(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => MedicationDelivery()));
              },
              textbutton: 'Medical Delivery'),
         SizedBox(
            height: 50,
          ),
      ],
    ),
    
      bottomNavigationBar: BottomNavigationBar(  
        // onTap: (value){
        //   setState((){
        //       indexClicked=value;
        //   }
        //   );},  
        items: [
          
          BottomNavigationBarItem(icon: Icon(

            Defaults.bottomNavItemIcon[0],   
          ),
          label: Defaults.bottomNavItemText[0],
          ),
          BottomNavigationBarItem(icon: Icon(
            Defaults.bottomNavItemIcon[1],   
          ),
          label: Defaults.bottomNavItemText[1],
          ),
          BottomNavigationBarItem(icon: Icon(
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
  const MyBottomNavigationBar({ Key? key }) : super(key: key);//note

  @override
  _MyBottomNavigationBarState createState() => _MyBottomNavigationBarState();
}

class _MyBottomNavigationBarState extends State<MyBottomNavigationBar> {
  int _indexClicked=0; //Index is clicked at position 0
  final List<Widget> _children=[
    IconHome(),
    IconNotifications(),
    IconProfile()
  ];

  @override
  Widget build(BuildContext context) {

    return new Scaffold(
      body: _children[_indexClicked],
      bottomNavigationBar: BottomNavigationBar(  

        onTap: (value)
        {
         setState(()
         {
           _indexClicked=value;
         });
        },

        items: [
          BottomNavigationBarItem(
            icon: new Icon(
              Icons.home),
              label: ('Home'), 
          ),
          BottomNavigationBarItem(icon: 
          new Icon(
              Icons.notifications),
              label: ('Notifications'), 
          ),
          BottomNavigationBarItem(icon: 
          new Icon(
              Icons.person),
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
                fontSize: 15,),           
      ),
    );
  }
}