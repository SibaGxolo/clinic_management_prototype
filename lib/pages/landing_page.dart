//By Asive Mrwetyana (to be edited)
//Landing page displays clickable icons for the different categories
import 'package:flutter/material.dart';

class Landing extends StatelessWidget {
  const Landing ({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Center(
          child: Text('Category List'),
          
        ),
        
      ),
       body: SafeArea(
        child: IconButton(
          onPressed: (){},
          icon: const Icon(Icons.medical_services_rounded
          
        ),
        iconSize: 200.0,
        tooltip: "Medical Assistance",//when you press and hold the icon, it displays text
       ),
       ),
      
    );
  }
}
