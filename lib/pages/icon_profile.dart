import 'package:clinic_management_prototype/preferences.dart';
import 'package:flutter/material.dart';

class IconProfile extends StatefulWidget {
  const IconProfile({Key? key}) : super(key: key);

  @override
  _IconProfileState createState() => _IconProfileState();
}

class _IconProfileState extends State<IconProfile> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Center(child: Text('Profile')),
        ),
        body: Center(
          child: Container(
            child: Column(
              children: [
                Text('${Preferences.user!.user!.displayName}'),
                Text('${Preferences.user!.user!.email}'),
                Text('${Preferences.user!.user!.uid}'),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
