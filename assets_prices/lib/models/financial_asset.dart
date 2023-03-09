import 'package:assets_prices/models/indicators.dart';
import 'package:assets_prices/models/meta.dart';

class FinancialAsset {
  FinancialAsset({
    required this.meta,
    required this.timestamp,
    required this.indicators,
  });

  Meta meta;
  List<int> timestamp;
  Indicators indicators;

  factory FinancialAsset.fromJson(Map<String, dynamic> json) => FinancialAsset(
        meta: Meta.fromJson(json["meta"]),
        timestamp: List<int>.from(json["timestamp"].map((x) => x)),
        indicators: Indicators.fromJson(json["indicators"]),
      );

  //API retornando sempre 0 no dia mais recente (???), removido para não zerar todos os gráficos no final

  List<DateTime> getLast30Dates() {
    List<DateTime> dates = [];
    this.timestamp.forEach((element) {
      dates.add(DateTime.fromMillisecondsSinceEpoch(element * 1000));
    });
    if (dates.length > 30) {
      dates = dates.sublist(dates.length - 31, dates.length - 1);
    } else {
      dates = dates.sublist(0, dates.length);
    }
    return dates;
  }

  List<double> getLast30QuotesOpening() {
    List<double> quotesOpening = [];
    this.indicators.quote.first.open.forEach((element) {
      quotesOpening.add(element);
    });
    if (quotesOpening.length > 30) {
      quotesOpening = quotesOpening.sublist(
          quotesOpening.length - 31, quotesOpening.length - 1);
    } else {
      quotesOpening = quotesOpening.sublist(0, quotesOpening.length - 1);
    }
    return quotesOpening;
  }
}
