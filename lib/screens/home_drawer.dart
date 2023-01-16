import 'package:flutter/material.dart';

class HomeDrawer extends StatelessWidget {
  const HomeDrawer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // return SingleChildScrollView(
    //   child: Column(
    //     children: [
    //       Container(
    //         color: Colors.black,
    //         width: double.infinity,
    //         height: 200,
    //         padding: const EdgeInsets.only(top: 20.0),
    //         child: Column(children: [
    //           Container(
    //             margin: const EdgeInsets.only(bottom: 10),
    //             height: 70,
    //           )
    //         ]),
    //       ),
    //     ],
    //   ),
    // );

    return Container(
      child: Text('WiFi'),
    );
  }
}
