import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:free_wifi_hotspots/widgets/stacked_colmn_chat.dart';

class AlertDialogWidget extends StatefulWidget {
  final double currentSpeedVal;
  bool isVisible;
  AlertDialogWidget(
      {super.key, required this.currentSpeedVal, required this.isVisible});

  @override
  State<AlertDialogWidget> createState() => _AlertDialogWidgetState();
}

class _AlertDialogWidgetState extends State<AlertDialogWidget> {
  // @override
  // void initState() {
  //   super.initState();
  //   Timer(
  //     const Duration(seconds: 5),
  //     () {
  //       setState(() {
  //         widget.isVisible = false;
  //         // print(isVisible);
  //       });
  //     },
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    print(widget.currentSpeedVal);
    return Visibility(
      visible: widget.isVisible,
      child: SizedBox(
        height: 250,
        child: AlertDialog(
          contentPadding: EdgeInsets.all(0),
          elevation: 24.0,
          backgroundColor: Colors.black,
          // title: Text('Hello'),
          content: StackedColumnWidget(currentSpeedVal: widget.currentSpeedVal),
        ),
      ),
    );
  }
}
