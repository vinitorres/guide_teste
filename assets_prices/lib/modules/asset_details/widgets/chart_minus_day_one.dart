import 'package:assets_prices/helpers/values_helper.dart';
import 'package:assets_prices/models/financial_asset.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class ChartMinusDayOne extends StatefulWidget {
  const ChartMinusDayOne({super.key, required this.financialAsset});

  final FinancialAsset financialAsset;

  @override
  State<ChartMinusDayOne> createState() => _ChartMinusDayOneState();
}

class _ChartMinusDayOneState extends State<ChartMinusDayOne> {
  double getMaxYValue() {
    var values = widget.financialAsset.getLast30QuotesOpening();
    return values.reduce((curr, next) => curr > next ? curr : next);
  }

  double getMinYValue() {
    var values = widget.financialAsset.getLast30QuotesOpening();
    return values.reduce((curr, next) => curr < next ? curr : next);
  }

  List<FlSpot> getSpots() {
    List<FlSpot> spots = [];
    var values = widget.financialAsset.getLast30QuotesOpening();
    values = values.map((e) => ValuesHelper.convertValue2Digits(e)).toList();
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
              isStrokeCapRound: false,
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
