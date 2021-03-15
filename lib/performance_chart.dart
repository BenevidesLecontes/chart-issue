import 'package:flutter/material.dart';
import 'package:sync_fusion_chart/chart_data.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class PerformanceChart extends StatelessWidget {
  const PerformanceChart({
    Key key,
    this.chartData,
  }) : super(key: key);

  final List<ChartData> chartData;

  @override
  Widget build(BuildContext context) {
    return SfCartesianChart(
      plotAreaBorderWidth: 0,
      primaryXAxis: DateTimeAxis(
        isVisible: false,
        majorGridLines: MajorGridLines(width: 0),
      ),
      selectionType: SelectionType.point,
      //Time axis and value axis transposition
      isTransposed: false,
      //Select gesture
      selectionGesture: ActivationMode.singleTap,
      //Illustration
      primaryYAxis: NumericAxis(
        isVisible: false,
        axisLine: AxisLine(width: 0),
        anchorRangeToVisiblePoints: false,
      ),
      series: _getSplineTypesSeries(context),

      crosshairBehavior: CrosshairBehavior(
        lineType: CrosshairLineType.both,
        //Horizontal selection indicator
        enable: true,
        shouldAlwaysShow: true,
        //The cross is always displayed (horizontal selection indicator)
        activationMode: ActivationMode.singleTap,
        lineColor: Color(0xFF7CA1C0),
        lineDashArray: [2.0],
      ),
    );
  }

  List<SplineSeries<ChartData, dynamic>> _getSplineTypesSeries(
      BuildContext context) {
    return <SplineSeries<ChartData, dynamic>>[
      SplineSeries<ChartData, dynamic>(
        splineType: SplineType.natural,
        dataSource: chartData,
        xValueMapper: (ChartData sales, _) => sales.updateAt,
        yValueMapper: (ChartData sales, _) => sales.lastTrade,
        width: 2,
      ),
    ];
  }
}
