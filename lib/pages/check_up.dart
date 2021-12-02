import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

class CheckUp extends StatefulWidget {
  const CheckUp({Key? key}) : super(key: key);

  @override
  _CheckUpState createState() => _CheckUpState();
}

class _CheckUpState extends State<CheckUp> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: MaterialApp(
      home: Scaffold(
        body: Container(
          child: SfCalendar(
            view: CalendarView.month,
          ),
        ),
      ),
    ));
  }
}
