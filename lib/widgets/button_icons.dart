import 'package:flutter/material.dart';
import 'package:free_wifi_hotspots/constant.dart';

class ButtonIcons extends StatefulWidget {
  final icons;
  bool onCheck;
  ButtonIcons({super.key, required this.icons, required this.onCheck});

  @override
  State<ButtonIcons> createState() => _ButtonIconsState();
}

class _ButtonIconsState extends State<ButtonIcons> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: widget.onCheck == true ? dfListBlue : null,
        color: widget.onCheck == true ? null : Colors.white,
        borderRadius: BorderRadius.circular(dfRadius),
      ),
      child: ElevatedButton(
        onPressed: () {
          setState(() {
            widget.onCheck = !widget.onCheck;
          });
        },
        style: ElevatedButton.styleFrom(
          padding: EdgeInsets.all(0), backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          // backgroundColor: colorbackground,
          alignment: Alignment.center,
        ),
        child: Icon(
          widget.icons,
          color: widget.onCheck == true ? Colors.white : colorbackground,
          size: 50,
        ),
      ),
    );
  }
}
