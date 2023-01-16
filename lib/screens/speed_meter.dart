import 'package:flutter/material.dart';
import 'package:free_wifi_hotspots/constant.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

class SpeedMeter extends StatefulWidget {
  final double currentSpeedVal;
  SpeedMeter({super.key, required this.currentSpeedVal});

  @override
  State<SpeedMeter> createState() => _SpeedMeterState();
}

class _SpeedMeterState extends State<SpeedMeter> {
  Widget _getGauge({bool isRadialGauge = true}) {
    if (isRadialGauge) {
      return _getRadialGauge();
    } else {
      return _getLinearGauge();
    }
  }

  Widget _getRadialGauge() {
    return SfRadialGauge(
        // title: const GaugeTitle(
        //     text: 'Speedometer',
        //     textStyle: TextStyle(
        //         fontSize: 20.0,
        //         fontWeight: FontWeight.bold,
        //         color: dfFontColor)),
        axes: <RadialAxis>[
          RadialAxis(minimum: 0, maximum: 150, ranges: <GaugeRange>[
            GaugeRange(
                startValue: 0,
                endValue: 50,
                color: Colors.red,
                startWidth: 5,
                endWidth: 5),
            GaugeRange(
                startValue: 50,
                endValue: 100,
                color: Colors.orange,
                startWidth: 5,
                endWidth: 5),
            GaugeRange(
                startValue: 100,
                endValue: 150,
                color: Colors.blue,
                startWidth: 5,
                endWidth: 5)
          ], pointers: <GaugePointer>[
            NeedlePointer(
              enableAnimation: true,
              knobStyle: KnobStyle(
                color: Colors.white,
              ),
              value: widget.currentSpeedVal,
              needleEndWidth: 2,
              needleColor: dfFontColor,
            )
          ], annotations: <GaugeAnnotation>[
            // GaugeAnnotation(widget: Container(), angle: 70, positionFactor: 0.5)
          ])
        ]);
  }

  Widget _getLinearGauge() {
    return Container(
      margin: const EdgeInsets.all(10),
      child: SfLinearGauge(
          minimum: 0.0,
          maximum: 100.0,
          orientation: LinearGaugeOrientation.horizontal,
          // majorTickStyle: const LinearTickStyle(length: 15),
          // axisLabelStyle: const TextStyle(fontSize: 8.0, color: Colors.white),
          axisTrackStyle: LinearAxisTrackStyle(
              color: Colors.cyan,
              edgeStyle: LinearEdgeStyle.bothFlat,
              thickness: 5.0,
              borderColor: Colors.grey)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return _getGauge();
  }
}
