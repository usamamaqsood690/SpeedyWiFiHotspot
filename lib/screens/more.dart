import 'package:flutter/material.dart';
import 'package:free_wifi_hotspots/constant.dart';
import 'package:free_wifi_hotspots/widgets/button_icons.dart';

class More extends StatelessWidget {
  More({super.key});

  bool onClick = true;
  // bool onBluetooth = true;
  // bool onData = true;
  // bool onAirplane = true;

  var iconButton = [
    Icons.share,
    Icons.bluetooth,
    Icons.four_g_mobiledata_outlined,
    Icons.airplanemode_active
  ];

  //  iconColor = [onShare,onBluetooth,onData,onAirplane];

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 50, horizontal: 5),
        child: CustomScrollView(
          slivers: [
            SliverGrid(
                delegate: SliverChildBuilderDelegate((context, i) {
                  return ButtonIcons(
                    icons: iconButton[i],
                    onCheck: onClick,
                  );
                }, childCount: iconButton.length),
                gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: 200,
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10,
                  childAspectRatio: 1,
                ))
          ],
        ),
      ),
    );
  }
}
