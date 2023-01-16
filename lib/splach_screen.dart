import 'dart:async';

import 'package:flutter/material.dart';
import 'package:free_wifi_hotspots/constant.dart';
import 'package:free_wifi_hotspots/screens/home_page.dart';
import 'package:free_wifi_hotspots/widgets/widgets.dart';
// import 'package:free_wifi_hotspots/widgets/wifi_widget.dart';

class SplachScreen extends StatefulWidget {
  const SplachScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<SplachScreen> createState() => _SplachScreenState();
}

class _SplachScreenState extends State<SplachScreen> {
  @override
  void initState() {
    super.initState();
    Timer(
        const Duration(seconds: 10),
        () => Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => HomePage())));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: dfBGColor,
        alignment: Alignment.center,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: 300,
                child: Logo(),
              ),
              const Text(
                'Speedy WiFi ',
                style: TextStyle(
                    color: dfFontColor,
                    fontSize: 40,
                    // fontFamily: dfFontFamily,
                    fontWeight: FontWeight.bold),
              ),
              const Text(
                'Hotspots',
                style: TextStyle(
                    color: dfFontColor,
                    fontSize: 40,
                    // fontFamily: dfFontFamily,
                    fontWeight: FontWeight.bold),
              ),
              // TextButton(
              // style: TextButton.styleFrom(
              //     padding: const EdgeInsets.symmetric(
              //   vertical: 30,
              // )),
              //   onPressed: () {
              //     'https://play.google.com/store/apps/dev?id=6192717105267620328';
              //   },
              //   child: Column(children: [
              //     Row(
              //       mainAxisAlignment: MainAxisAlignment.center,
              //       children: [
              //         SizedBox(
              //           width: 40,
              //           child: Image.asset(
              //             'asserts/images/playstore.png',
              //           ),
              //         ),
              //         Column(
              //           children: [
              //             const Text(
              //               'powered by',
              //               style: TextStyle(
              //                   color: dfFontColor,
              //                   fontSize: 12,
              //                   // fontFamily: dfFontFamily,
              //                   fontStyle: FontStyle.italic,
              //                   fontWeight: FontWeight.bold),
              //             ),
              //             Container(
              //               margin: const EdgeInsets.only(left: 10),
              //               child: const Text(
              //                 'Google Play Store',
              //                 style: TextStyle(
              //                     color: dfFontColor,
              //                     fontSize: 18,
              //                     // fontFamily: dfFontFamily,
              //                     // fontStyle: FontStyle.italic,
              //                     fontWeight: FontWeight.bold),
              //               ),
              //             ),
              //           ],
              //         ),
              //       ],
              //     )
              //   ]),
              // ),
              Container(
                margin: const EdgeInsets.only(top: 50),
                // child: const CircularProgressIndicator(color: colorLoder),
                child: const SizedBox(width: 50, child: Loader()),
              ),
            ],
          ),
        ),
        // ),
      ),
    );
  }
}
