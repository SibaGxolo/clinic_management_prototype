import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class IconNotifications extends StatefulWidget {
  const IconNotifications({Key? key}) : super(key: key);

  @override
  _IconNotificationsState createState() => _IconNotificationsState();
}

class _IconNotificationsState extends State<IconNotifications> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text('Notifications')),
      ),
      body: const Center(
        child: SpinKitFadingCircle(
          color: Colors.blue,
          size: 50,
        ),
      ),
    );
  }
}
