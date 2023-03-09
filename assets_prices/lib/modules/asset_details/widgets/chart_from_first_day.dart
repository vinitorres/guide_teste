import 'package:assets_prices/helpers/values_helper.dart';
import 'package:assets_prices/models/financial_asset.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class ChartFromFirstDay extends StatefulWidget {
  const ChartFromFirstDay({super.key, required this.financialAsset});

  final FinancialAsset financialAsset;

  @override
  State<ChartFromFirstDay> createState() => _ChartFromFirstDayState();
}

class _ChartFromFirstDayState extends State<ChartFromFirstDay> {
  double getMaxYValue() {
    var values = ValuesHelper.getPercentToFirstDay(widget.financialAsset);
    return values.reduce((curr, next) => curr > next ? curr : next);
  }

  double getMinYValue() {
    var values = ValuesHelper.getPercentToFirstDay(widget.financialAsset);
    return values.reduce((curr, next) => curr < next ? curr : next);
  }

  List<FlSpot> getSpots() {
    List<FlSpot> spots = [];
    var values = ValuesHelper.getPercentToFirstDay(widget.financialAsset);
    for (int i = 0; i < values.length; i++) {
      spots.add(FlSpot(i.toDouble(), values[i]));
    }
    return spots;
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Container(
        padding: EdgeInsets.all(16),
        height: 500,
        width: 500,
        child: LineChart(LineChartData(
          lineBarsData: [
            LineChartBarData(
              spots: getSpots(),
              isCurved: false,
              barWidth: 3,
              isStrokeCapRound: true,
              dotData: FlDotData(
                show: false,
              ),
              belowBarData: BarAreaData(
                show: true,
              ),
            ),
          ],
          maxX: 30,
          minX: 0,
          maxY: getMaxYValue(),
          minY: getMinYValue(),
        )),
      ),
    );
  }
}
