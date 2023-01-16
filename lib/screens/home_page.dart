// @dart=2.9

import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:free_wifi_hotspots/constant.dart';
import 'package:free_wifi_hotspots/screens/bottomNavBar.dart';
import 'package:free_wifi_hotspots/screens/home_drawer.dart';
import 'package:free_wifi_hotspots/screens/speed_meter.dart';
// import 'package:free_wifi_hotspots/screens/vanish_section.dart';
import 'package:free_wifi_hotspots/screens/wifi_list.dart';
import 'package:free_wifi_hotspots/widgets/alert_dialog_widget.dart';
// import 'package:free_wifi_hotspots/widgets/stacked_colmn_chat.dart';
import 'package:free_wifi_hotspots/widgets/widgets.dart';
import 'package:wifi_info_plugin/wifi_info_plugin.dart';
import 'package:wifi_scan/wifi_scan.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<WiFiAccessPoint> accessPoints = <WiFiAccessPoint>[];
  WiFiAccessPoint accessPt2;

  // StreamSubscription<List<WiFiAccessPoint>> subscription;
  bool shouldCheckCan = true;
  int length = 0;

  Future<bool> _canGetScannedResults() async {
    if (shouldCheckCan) {
      // check if can-getScannedResults
      final can = await WiFiScan.instance.canGetScannedResults();
      // if can-not, then show error
      if (can != CanGetScannedResults.yes) {
        if (mounted) kShowSnackBar(context, "Cannot get scanned results: $can");
        accessPoints = <WiFiAccessPoint>[];
        return false;
      }
    }
    return true;
  }

  Future<void> _getScannedResults() async {
    if (await _canGetScannedResults()) {
      // get scanned results
      final results = await WiFiScan.instance.getScannedResults();
      if (this.mounted) {
        setState(() => accessPoints = results);
      }
    }
  }

  //WiFi info Wapper Object
  List<WifiInfoWrapper> wifiObjList = <WifiInfoWrapper>[];
  WifiInfoWrapper wifiObj;
  bool isVisible;

  void GraphTimer() {
    isVisible = true;
    Timer(
      const Duration(milliseconds: 4500),
      () {
        if (this.mounted) {
          setState(() {
            isVisible = false;
          });
        }
      },
    );
  }

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
    _getScannedResults();
    GraphTimer();
    try {
      wifiObject = await WifiInfoPlugin.wifiDetails;
    } on PlatformException {}
    if (!mounted) return;

    setState(() {
      wifiObj = wifiObject;
    });
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: initPlatformState,
      child: Container(
          color: dfBGColor,
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: dfMargin),
            child: CustomScrollView(
              slivers: [
                // SliverAppBar(
                //   expandedHeight: 90,
                //   pinned: true,
                //   backgroundColor: Colors.black,
                //   // leadingWidth: 40,
                //   automaticallyImplyLeading: false,
                //   leading: Stack(
                //     // crossAxisAlignment: CrossAxisAlignment.center,
                //     children: [
                //       SizedBox(
                //         width: 40,
                //         height: 40,
                //         child: SpeedMeter(
                //             currentSpeedVal: wifiObj != null
                //                 ? wifiObj.linkSpeed.toDouble()
                //                 : 0.0),
                //       ),
                //       Stack(
                //         children: [
                //           Text(
                //             wifiObj != null
                //                 ? wifiObj.linkSpeed.toString()
                //                 : "speed",
                //             style: const TextStyle(
                //                 color: dfFontColor, fontSize: dfFSize),
                //           ),
                //           Text(
                //             'Mbps',
                //             style: TextStyle(
                //                 color: dfFontColor, fontSize: dfFSmSize),
                //           ),
                //         ],
                //       ),
                //     ],
                //   ),
                //   flexibleSpace: FlexibleSpaceBar(
                //     centerTitle: true,
                //     title: Text(
                //       wifiObj != null ? wifiObj.ssid : "Horizon",
                //       style: const TextStyle(
                //           fontWeight: FontWeight.bold,
                //           color: dfFontColor,
                //           fontSize: 18),
                //     ),
                //   ),
                // ),
                SliverList(
                    delegate: SliverChildListDelegate([
                  Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: 40,
                            height: 40,
                            child: SpeedMeter(
                                currentSpeedVal: wifiObj != null
                                    ? wifiObj.linkSpeed.toDouble()
                                    : 0.0),
                          ),
                          Row(
                            children: [
                              Text(
                                wifiObj != null
                                    ? wifiObj.linkSpeed.toString()
                                    : "speed",
                                style: const TextStyle(
                                    color: dfFontColor, fontSize: dfFSize),
                              ),
                              const Padding(
                                padding: EdgeInsets.only(top: 10),
                                child: Text(
                                  'Mbps',
                                  style: TextStyle(
                                      color: dfFontColor, fontSize: dfFSmSize),
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                      const Spacer(),
                      Text(
                        // accessPt2 != null ? accessPt2.ssid : 'Horizon',
                        wifiObj != null ? wifiObj.ssid : "Horizon",
                        style: const TextStyle(
                            color: dfFontColor,
                            fontSize: dfWifiNameFont,
                            fontWeight: FontWeight.bold),
                      ),
                      const Spacer(),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: 45,
                            margin: const EdgeInsets.only(right: 4),
                            child: const Logo(),
                          ),
                          Row(
                            children: [
                              Container(
                                margin: EdgeInsets.only(left: 15),
                                child: Text(
                                  "${wifiObj != null ? wifiObj.signalStrength.toString() : "Signal"}",
                                  style: const TextStyle(
                                      color: dfFontColor, fontSize: dfFSize),
                                ),
                              ),
                              const Padding(
                                padding: EdgeInsets.only(top: 10),
                                child: Text(
                                  'dBm',
                                  style: TextStyle(
                                      color: dfFontColor, fontSize: dfFSmSize),
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ])),
                SliverList(
                  delegate: SliverChildListDelegate([
                    AlertDialogWidget(
                        isVisible: isVisible,
                        currentSpeedVal: wifiObj != null
                            ? wifiObj.linkSpeed.toDouble()
                            : 58.0),
                  ]),
                ),
                SliverList(
                  delegate: SliverChildListDelegate([
                    Container(
                      margin: const EdgeInsets.only(bottom: 10),
                      child: const Text(
                        'Free WiFi(OPEN)',
                        style: TextStyle(color: Colors.white, fontSize: 18),
                        textAlign: TextAlign.center,
                      ),
                    )
                  ]),
                ),

                accessPoints.isEmpty
                    ? SliverList(
                        delegate: SliverChildListDelegate([
                        const Text(
                          'No Network Found',
                          style: TextStyle(color: Colors.white),
                        )
                      ]))
                    : SliverGrid(
                        delegate: SliverChildBuilderDelegate(
                          (context, i) {
                            print(accessPoints[i].capabilities);

                            return accessPoints[i].capabilities.contains('ESS')
                                ? WifiList(
                                    iconCustom: Icons.wifi,
                                    accessPoint: accessPoints[i],
                                    iconcolor: colorbackground,
                                    backColor: dfListGreen,
                                    function: () {
                                      setState(() {
                                        GraphTimer();
                                      });
                                    },
                                  )
                                : null;
                          },
                          childCount: 3,
                        ),
                        gridDelegate:
                            const SliverGridDelegateWithMaxCrossAxisExtent(
                          maxCrossAxisExtent: 400,
                          mainAxisSpacing: 10,
                          // crossAxisSpacing: 10,
                          childAspectRatio: 4,
                        ),
                      ),

                SliverList(
                  delegate: SliverChildListDelegate([
                    const Divider(
                      color: Colors.white,
                      thickness: 2.5,
                      indent: 20,
                      endIndent: 20,
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(vertical: 10),
                      child: const Text(
                        'Secure WiFi (Password Required)',
                        style: TextStyle(color: Colors.white, fontSize: 18),
                        textAlign: TextAlign.center,
                      ),
                    )
                  ]),
                ),
                accessPoints.isEmpty
                    ? SliverList(
                        delegate: SliverChildListDelegate([
                        const Text(
                          'No Network Found',
                          style: TextStyle(color: Colors.white),
                        )
                      ]))
                    : SliverGrid(
                        delegate: SliverChildBuilderDelegate(
                          (context, i) {
                            // i += 3;
                            return WifiList(
                              iconCustom: Icons.wifi_password,
                              accessPoint: accessPoints[i],
                              iconcolor: Colors.red,
                              backColor: dfListBlue,
                              function: () {
                                setState(() {
                                  GraphTimer();
                                });
                              },
                            );
                          },
                          childCount: 5,
                        ),
                        gridDelegate:
                            const SliverGridDelegateWithMaxCrossAxisExtent(
                          maxCrossAxisExtent: 400,
                          mainAxisSpacing: 10,
                          // crossAxisSpacing: 10,
                          childAspectRatio: 4,
                        ),
                      ),
                SliverList(
                    delegate: SliverChildListDelegate([
                  Container(
                    margin: EdgeInsets.only(bottom: 30),
                  )
                ])),
              ],
            ),
          )),
    );
  }
}

/// Show snackbar.
void kShowSnackBar(BuildContext context, String message) {
  if (kDebugMode) print(message);
  ScaffoldMessenger.of(context)
    ..hideCurrentSnackBar()
    ..showSnackBar(SnackBar(content: Text(message)));
}
