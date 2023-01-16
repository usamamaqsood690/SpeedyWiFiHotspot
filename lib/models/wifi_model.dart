// // @dart=2.9

// import 'package:flutter/material.dart';
// import 'dart:async';
// import 'package:wifi_info_plugin/wifi_info_plugin.dart';
// import 'package:flutter/services.dart';

// class WifiModel extends StatefulWidget {
//   const WifiModel({Key key}) : super(key: key);

//   @override
//   State<WifiModel> createState() => _WifiModelState();
// }

// class _WifiModelState extends State<WifiModel> {
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
//     return Container();
//   }
// }
