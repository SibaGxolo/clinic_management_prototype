import 'package:clinic_management_prototype/pages/patient.dart';
import 'package:clinic_management_prototype/widgets/button.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Register extends StatelessWidget {
   Register ({Key? key}) : super(key: key);
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar( //kkm code
        title: Text('Registeration'),
      ), 
      body: Center( 
     child: Column(
       children: [
         SizedBox(height: 130),
         Text('User can register as a:',textAlign: TextAlign.center,
           style: GoogleFonts.lato(
                  color: Colors.blue,
                  fontWeight: FontWeight.w700,
                  fontSize: 25,
         )),
         SizedBox(height: 20,),
        Button(
             buttontext: 'Patient',
             onPressed: () 
             {
                 Navigator.push(
                 context,
                 MaterialPageRoute(
                builder: (context) => Patient()
                ));
               }),
          SizedBox(height: 5),
        Button(buttontext: 'Nurse', onPressed: ()
        {
          
        }),
         SizedBox(height: 5),
        Button(buttontext: 'Driver', onPressed: ()
        {

        }),
         SizedBox(height: 5),
        Button(buttontext: 'Distributor', onPressed: ()
        {

        }),
         SizedBox(height: 5),
        Button(buttontext: 'Hall', onPressed: ()
        {

        }),
       
       ]),
      ), 
    );
  }//kkm code
}
