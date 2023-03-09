import 'package:assets_prices/models/financial_asset.dart';

class Chart {
  Chart({
    required this.result,
    this.error,
  });

  List<FinancialAsset> result;
  dynamic error;

  factory Chart.fromJson(Map<String, dynamic> json) => Chart(
        result: List<FinancialAsset>.from(
            json["result"].map((x) => FinancialAsset.fromJson(x))),
        error: json["error"],
      );
}