import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
//This class is for the bottom notification navigation, to display either the patients who came for check-ups or medical emergency.

class IconNotifications extends StatefulWidget {
  const IconNotifications({Key? key}) : super(key: key);

  @override
  _IconNotificationsState createState() => _IconNotificationsState();
}

class _IconNotificationsState extends State<IconNotifications> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Center(child: Text('Notifications')),
        ),
        body: const Center(
          child: SpinKitFadingCircle(
            color: Colors.blue,
            size: 50,
          ),
        ),
      ),
    );
  }
}
