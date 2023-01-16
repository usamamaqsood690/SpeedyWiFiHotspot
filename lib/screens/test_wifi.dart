import 'package:flutter/material.dart';
import 'package:wifi_scan/wifi_scan.dart';

class TestWifi extends StatelessWidget {
  final WiFiAccessPoint accessPoint;
  const TestWifi({super.key, required this.accessPoint});

  @override
  Widget build(BuildContext context) {
    final title = accessPoint.ssid.isNotEmpty ? accessPoint.ssid : "**EMPTY**";
    return Container();
  }
}
