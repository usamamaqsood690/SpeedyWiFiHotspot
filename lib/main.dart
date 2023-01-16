// @dart=2.9

import 'package:flutter/material.dart';
import 'package:free_wifi_hotspots/screens/bottomNavBar.dart';
// import 'package:free_wifi_hotspots/screens/home_page.dart';
import 'package:free_wifi_hotspots/splach_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Free WiFi HotSpots',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.grey,
      ),
      // home: const SplachScreen(),
      home: StreamBuilder(builder: (ctx, userSnapShot) {
        if (userSnapShot.connectionState == ConnectionState.waiting) {
          return SplachScreen();
        }
        return BottomNavBar();
      }),
    );
  }
}
