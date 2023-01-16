// @dart=2.9

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:free_wifi_hotspots/constant.dart';
import 'package:wifi_info_plugin/wifi_info_plugin.dart';
import 'package:wifi_scan/wifi_scan.dart';

class WifiList extends StatefulWidget {
  final iconCustom;
  final Color iconcolor;
  final Function function;
  final Gradient backColor;
  // bool isVisible;
  final WiFiAccessPoint accessPoint;
  WifiList(
      {Key key,
      this.iconCustom,
      this.accessPoint,
      this.iconcolor,
      this.function,
      this.backColor})
      : super(key: key);

  @override
  State<WifiList> createState() => _WifiListState();
}

class _WifiListState extends State<WifiList> {
  WifiInfoWrapper wifiObj;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    initPlatformState();
  }

// Platform messages are asynchronous, so we initialize in an async method.
  Future<void> initPlatformState() async {
    WifiInfoWrapper wifiObject;
    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      wifiObject = await WifiInfoPlugin.wifiDetails;
    } on PlatformException {}
    if (!mounted) {
      setState(() {
        wifiObj = wifiObject;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    // final title = widget.accessPoint.ssid.isNotEmpty
    // ? widget.accessPoint.ssid
    // : "**EMPTY**";
    return Container(
      decoration: BoxDecoration(
        gradient: widget.backColor,
        borderRadius: BorderRadius.circular(dfRadius),
      ),

      child: TextButton(
        onPressed: widget.function,
        style: TextButton.styleFrom(padding: const EdgeInsets.all(0)),
        child: ListTile(
          contentPadding: const EdgeInsets.only(
            // top: 8,
            left: 8,
            right: 8,
          ),
          leading: Icon(
            widget.iconCustom,
            color: widget.iconcolor,
            size: 35,
          ),
          hoverColor: Colors.amber,

          minLeadingWidth: 60,
          // shape: Border(bottom: BorderSide.none),
          title: Text(
              "${widget.accessPoint.ssid.isNotEmpty ? widget.accessPoint.ssid : "**EMPTY**"}",
              style: TextStyle(color: dfFontColor, fontSize: dfFSize)),
          trailing: SizedBox(
            width: 50,
            child: Stack(
              children: [
                Positioned(
                  bottom: 10,
                  left: -0.5,
                  child: Text(
                    "${widget.accessPoint != null ? widget.accessPoint.level : "80.5"}",
                    style: TextStyle(color: dfFontColor, fontSize: dfFSize),
                  ),
                ),
                Positioned(
                  bottom: 7,
                  right: -0.5,
                  child: Text(
                    'dBm',
                    style: TextStyle(color: dfFontColor, fontSize: dfFSmSize),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      // Row(
      //   children: [
      //     Text("${wifiObj != null ? wifiObj.ssid.toString() : "Horizon"}",
      //         style: TextStyle(color: dfFontColor, fontSize: dfFSize)),
      //     const Spacer(),
      //     Stack(
      //       clipBehavior: Clip.none,
      //       children: [
      //         const Icon(
      //           Icons.wifi,
      //           color: dfFontColor,
      //           size: 35,
      //         ),
      //         Positioned(
      //           bottom: -10,
      //           right: -30,
      //           child: Text(
      //             "${wifiObj != null ? wifiObj.linkSpeed.toString() : "72"}Mbps",
      //             style: TextStyle(color: dfFontColor, fontSize: dfFSmSize),
      //           ),
      //         ),
      //       ],
      //     ),
      //     const Spacer(),
      //     Row(
      //       children: [
      //         Text(
      //           "${wifiObj != null ? wifiObj.signalStrength.toString() : "80.5"}",
      //           style: TextStyle(color: dfFontColor, fontSize: dfFSize),
      //         ),
      //         Padding(
      //           padding: EdgeInsets.only(top: 10),
      //           child: Text(
      //             'dBm',
      //             style: TextStyle(color: dfFontColor, fontSize: dfFSmSize),
      //           ),
      //         )
      //       ],
      //     ),
      //   ],
      // ),
    );
  }
}
