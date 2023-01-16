// // @dart=2.9

// import 'package:flutter/services.dart';
// import 'package:flutter/material.dart';
// import 'dart:async';
// import 'package:wifi_info_plugin/wifi_info_plugin.dart';

// void main() => runApp(WifiInfo());

// class WifiInfo extends StatefulWidget {
//   @override
//   _WifiInfoState createState() => _WifiInfoState();
// }

// class _WifiInfoState extends State<WifiInfo> {
//   WifiInfoWrapper _wifiObject;

//   @override
//   void initState() {
//     super.initState();
//     initPlatformState();
//   }

//   // Platform messages are asynchronous, so we initialize in an async method.
//   Future<void> initPlatformState() async {
//     WifiInfoWrapper wifiObject;
//     // Platform messages may fail, so we use a try/catch PlatformException.
//     try {
//       wifiObject = await WifiInfoPlugin.wifiDetails;
//     } on PlatformException {}
//     if (!mounted) return;

//     setState(() {
//       _wifiObject = wifiObject;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     // String ipAddress =
//     //     _wifiObject != null ? _wifiObject.routerIp.toString() : "ip";
//     // return MaterialApp(
//     //   home: Scaffold(
//     //     appBar: AppBar(
//     //       title: const Text('Plugin example app'),
//     //     ),
//     //     body: Center(
//     //       child: Text('Running on: $ipAddress'),
//     //     ),
//     //   ),
//     // );
//   }
// }
