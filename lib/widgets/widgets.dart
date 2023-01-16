import 'package:flutter/material.dart';
import 'package:free_wifi_hotspots/constant.dart';

class Logo extends StatelessWidget {
  const Logo({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.asset('asserts/images/giphy.gif',
        colorBlendMode: BlendMode.color, color: colorbackground);
  }
}

class Loader extends StatelessWidget {
  const Loader({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.asset('asserts/images/loader1.gif',
        colorBlendMode: BlendMode.color, color: colorLoder);
  }
}
