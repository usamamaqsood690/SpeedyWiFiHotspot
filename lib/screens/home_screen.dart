import 'package:flutter/material.dart';
import 'package:free_wifi_hotspots/constant.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        color: dfBGColor,
        child: Container(
          color: Colors.white,
          margin: const EdgeInsets.only(top: 30, left: 10, right: 10),
          // child: SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.all(10),
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 400,
                mainAxisSpacing: 10,
                // crossAxisSpacing: 10,
                childAspectRatio: 5,
              ),
              itemBuilder: (context, i) {
                return Container(
                  color: Colors.amber,
                );
              },
              itemCount: 4,
            ),
          ),
          // ),
        ));
  }
}
