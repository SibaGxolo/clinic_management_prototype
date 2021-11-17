import 'package:flutter/material.dart';

class IconNotifications extends StatefulWidget {
  const IconNotifications({ Key? key }) : super(key: key);

  @override
  _IconNotificationsState createState() => _IconNotificationsState();
}

class _IconNotificationsState extends State<IconNotifications> {
  @override
  Widget build(BuildContext context) {
    return Scaffold
    (
      appBar: AppBar
      (
        title: Center(child: Text('Notifications')),
      ),
    );
  }
}