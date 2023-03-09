import 'package:assets_prices/models/chart_response.dart';
import 'package:assets_prices/models/financial_asset.dart';
import 'package:dio/dio.dart';

// AMER3.SA
// PETR4.SA
// https://query2.finance.yahoo.com/v8/finance/chart/AMER3.SA

class YahooFinanceService {
  final dio = Dio();

  final String _baseUrl = 'https://query2.finance.yahoo.com/v8/finance/';

  //Endpoints
  final String chartUrl = 'chart/{symbol}?interval=1d&range=max';

  Future<FinancialAsset?> getFinancialAsset(String symbol) async {
    var url = _baseUrl + chartUrl.replaceAll('{symbol}', symbol);

    final response = await dio.get(url);
    if (response.statusCode == 200) {
      var chartResponse = ChartResponse.fromJson(response.data);
      return chartResponse.chart.result.first;
    } else {
      throw Exception('Failed to load asset');
    }
  }
}
