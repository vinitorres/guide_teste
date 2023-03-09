import 'package:assets_prices/models/chart.dart';

class ChartResponse {
  ChartResponse({
    required this.chart,
  });
  Chart chart;

  factory ChartResponse.fromJson(Map<String, dynamic> json) => ChartResponse(
        chart: Chart.fromJson(json["chart"]),
      );
}