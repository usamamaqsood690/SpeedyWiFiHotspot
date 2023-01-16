import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:wifi_info_plugin/wifi_info_plugin.dart';

class StackedColumnWidget extends StatefulWidget {
  final double currentSpeedVal;
  StackedColumnWidget({super.key, required this.currentSpeedVal});

  @override
  State<StackedColumnWidget> createState() => _StackedColumnWidgetState();
}

class _StackedColumnWidgetState extends State<StackedColumnWidget> {
  late List<_ChartData> data;
  late List point;

  // late TooltipBehavior _tooltip;

  @override
  void initState() {
    data = [
      _ChartData(0, widget.currentSpeedVal >= 0 ? 15 : 0, Colors.red),
      _ChartData(1, widget.currentSpeedVal >= 10 ? 35 : 0, Colors.orange),
      _ChartData(2, widget.currentSpeedVal >= 20 ? 20 : 0, Colors.yellow),
      _ChartData(3, widget.currentSpeedVal >= 30 ? 60 : 0, Colors.green),
      _ChartData(4, widget.currentSpeedVal >= 40 ? 40 : 0, Colors.blue),
      _ChartData(5, widget.currentSpeedVal >= 50 ? widget.currentSpeedVal : 0,
          Colors.white),
    ];

    // _tooltip = TooltipBehavior(enable: true);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print(widget.currentSpeedVal);
    return SfCartesianChart(
        primaryXAxis: CategoryAxis(
            axisLine: AxisLine(color: Colors.white),
            majorGridLines: MajorGridLines(width: 0)),
        plotAreaBorderColor: Colors.black,
        primaryYAxis: NumericAxis(
          // isInversed: true,
          minimum: 0,
          maximum: 90,
          interval: 90,
          axisLine: AxisLine(color: Colors.white),
        ),
        // tooltipBehavior: _tooltip,

        series: <ChartSeries<_ChartData, int>>[
          ColumnSeries<_ChartData, int>(
              dataSource: data,
              pointColorMapper: (_ChartData data, _) => data.color,
              xValueMapper: (_ChartData data, _) => data.x,
              yValueMapper: (_ChartData data, _) => data.y,
              width: 0.8,
              animationDuration: 2000),
          LineSeries<_ChartData, int>(
              animationDuration: 4500,
              dataSource: data,
              xValueMapper: (_ChartData data, _) => data.x,
              yValueMapper: (_ChartData data, _) => data.y,
              yAxisName: 'yAxis1',
              markerSettings: MarkerSettings(isVisible: true),
              name: 'Total Transaction')
        ]);
  }
}

class _ChartData {
  _ChartData(this.x, this.y, this.color);
  final int x;
  final double y;
  final Color color;
}
