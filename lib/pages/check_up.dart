// ignore_for_file: prefer_const_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';



class CheckUp extends StatefulWidget {
  const CheckUp({ Key? key }) : super(key: key);

  @override
  _CheckUpState createState() => _CheckUpState();
}

class _CheckUpState extends State<CheckUp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold (
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Center(
          child: Text('Check Up'),

        ),
      ),
     body: SingleChildScrollView(
       child: Column(
         crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 200,
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(30),
                  bottomRight: Radius.circular(30)

                )
              ),
              child: Row(
                children: [
                  Container(
                    margin: EdgeInsets.only(bottom: 20),
                    child: Image.asset('name'),
                  ),
                  Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          margin: EdgeInsets.only(top: 20),
                          child: Text('Nurse Betty',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 22,
                            fontFamily: "Roboto",
                            fontWeight: FontWeight.w700,
                          ),
                          )
                        ),
                         Container(
                          margin: EdgeInsets.only(top: 20),
                          child: Text('General Nurse',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 22,
                            fontFamily: "Roboto",
                            fontWeight: FontWeight.w700,
                          ),
                          )
                        )
                        

                      ],
                    ),
                  )
                ],
              ),
            ),
          Container(
                          margin: EdgeInsets.only(left: 20, top: 20),
                          child: Text('December 2021',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 22,
                            fontFamily: "Roboto",
                            fontWeight: FontWeight.w700,
                          ),
                          )
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 20, top: 20, right:20 ),
                          height: 90,
                          child: ListView(
                            scrollDirection: Axis.horizontal,
                            children: [
                              appointmentDates("Wed", "1", true),
                              appointmentDates("Thur", "2", false),
                              appointmentDates("Fri", "3", false),
                              appointmentDates("Sat", "4", false),
                              appointmentDates("Sun", "5", false),
                              appointmentDates("Mon", "6", false),
                              appointmentDates("Tue", "7", false),
                              appointmentDates("Wed", "8", false)
                            ],
                          ),
                        ),
                         Container(
                          margin: EdgeInsets.only(left: 20 ,top: 20),
                          child: Text('Morning',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 25,
                            fontFamily: "Roboto",
                            fontWeight: FontWeight.w700,
                          ),
                          )
                        ),
                        Container(
                          margin: EdgeInsets.only(left:20, top:20, right: 20),
                          child: GridView.count(
                            shrinkWrap: true,
                            crossAxisCount: 3,
                            physics: NeverScrollableScrollPhysics(),
                            childAspectRatio: 2.7,
                            children: [
                              timelines("8:30 AM", false),
                              timelines("9:00: AM", false),
                              timelines("9:30 AM", false),
                              timelines("10:00 AM", false),
                              timelines("10:30 AM", false),
                              timelines("11:00 AM", false),
                             

                            ],
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 20 ,top: 20),
                          child: Text('Afternoon',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 25,
                            fontFamily: "Roboto",
                            fontWeight: FontWeight.w700,
                          ),
                          )
                        ),
                        Container(
                          margin: EdgeInsets.only(left:20, top:20, right: 20),
                          child: GridView.count(
                            shrinkWrap: true,
                            crossAxisCount: 3,
                            physics: NeverScrollableScrollPhysics(),
                            childAspectRatio: 2.7,
                            children: [
                              timelines("12:00 PM", false),
                              timelines("12:30 PM", false),
                              timelines("13:00 PM", false),
                              timelines("13:30 PM", false),
                              timelines("14:00 PM", false),
                              timelines("14:30 PM", false),
                             

                            ],
                          ),
                        ),

                        Container(
                          alignment: Alignment.center,
                          width: MediaQuery.of(context).size.width,
                          margin: EdgeInsets.all(20),
                          decoration: BoxDecoration(
                            color: Colors.teal,
                            borderRadius: BorderRadius.circular(6,)
                          ),
                          child: Text('Book an appointment',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontFamily: 'Roboto',
                            fontWeight: FontWeight.w500
                          ),),
                        )
          
          ],
       )
     ) ,

      
    );
  }
  timelines(String time, bool isChosen){
    return isChosen ? Container(
      margin: EdgeInsets.only(left:  20, top: 30, right: 20) ,
      decoration: BoxDecoration(
        color: Colors.teal,
        borderRadius: BorderRadius.circular(5)
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            margin: EdgeInsets.only(right: 2),
            child: Icon(Icons.access_time,
            color: Colors.white,
            size: 18,
            )
          ),
          Container(
            margin: EdgeInsets.only(right: 2),
            child: Text(time,
            style: TextStyle(
              color: Colors.black,
              fontSize: 17,
              fontFamily:'Roboto'
            ),
            ),
          )
        ],
      ),

    ):Container(
      decoration: BoxDecoration(
        color: Colors.blue,
        borderRadius: BorderRadius.circular(5)
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            margin: EdgeInsets.only(right: 2),
            child: Icon(Icons.access_time,
            color: Colors.white,
            size: 18,
            )
          ),
          Container(
            margin: EdgeInsets.only(right: 2),
            child: Text(time,
            style: TextStyle(
              color: Colors.black,
              fontSize: 17,
              fontFamily:'Roboto'
            ),
            ),
          )
        ],
      ),

    );
  }
  appointmentDates(String day, String date, bool isChosen){
    return isChosen ? Container(
      width: 70,
      margin: EdgeInsets.only(right: 15),
      decoration: BoxDecoration(
        color: Colors.teal,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            child: Text(
              day,
              style: TextStyle(
                color: Colors.blue,
                fontSize: 20,
                fontFamily: "Roboto",
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 10),
            padding: EdgeInsets.all(3),
            child: Text(
              date,
              style: TextStyle(
                color: Colors.blue,
                fontSize: 15,
                fontFamily: "Roboto",
                fontWeight: FontWeight.w500,

              ),
              ),
          )
        ],
      ),
    ):Container(
      width: 70,
      margin: EdgeInsets.only(right: 15),
      decoration: BoxDecoration(
        color: Colors.blue,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            child: Text(
              day,
              style: TextStyle(
                color: Colors.black,
                fontSize: 20,
                fontFamily: "Roboto",
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 10),
            padding: EdgeInsets.all(3),
            child: Text(
              date,
              style: TextStyle(
                color: Colors.black,
                fontSize: 15,
                fontFamily: "Roboto",
                fontWeight: FontWeight.w500,

              ),
              ),
          )
        ],
      ),


    );

  }
}


