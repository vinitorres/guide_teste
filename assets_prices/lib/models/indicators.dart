import 'package:assets_prices/models/quote.dart';

class Indicators {
  Indicators({
    required this.quote,
  });

  List<Quote> quote;

  factory Indicators.fromJson(Map<String, dynamic> json) => Indicators(
        quote: List<Quote>.from(json["quote"].map((x) => Quote.fromJson(x))),
      );
}