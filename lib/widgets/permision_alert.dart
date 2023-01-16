import 'package:flutter/material.dart';

class PermissionAlert extends StatefulWidget {
  const PermissionAlert({super.key});

  @override
  State<PermissionAlert> createState() => _PermissionAlertState();
}

class _PermissionAlertState extends State<PermissionAlert> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: SizedBox(
        height: 250,
        child: AlertDialog(
          contentPadding: EdgeInsets.all(0),
          elevation: 24.0,
          // backgroundColor: Colors.black,
          title: Text('WiFi Name'),
          content: Text('Wifi List'),
          actions: [
            TextButton(onPressed: () {}, child: Text('Yes, Connect it.')),
            TextButton(onPressed: () {}, child: Text('No, I will Choose it!'))
          ],
        ),
      ),
    );
  }
}
