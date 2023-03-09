import 'package:assets_prices/models/current_trading_period.dart';
import 'package:assets_prices/models/post.dart';

class Meta {
  Meta({
    required this.currency,
    required this.symbol,
    required this.exchangeName,
    required this.instrumentType,
    required this.firstTradeDate,
    required this.regularMarketTime,
    required this.gmtoffset,
    required this.timezone,
    required this.exchangeTimezoneName,
    required this.regularMarketPrice,
    required this.chartPreviousClose,
    this.previousClose,
    this.scale,
    required this.priceHint,
    required this.currentTradingPeriod,
    this.tradingPeriods,
    required this.dataGranularity,
    required this.range,
    required this.validRanges,
  });

  String currency;
  String symbol;
  String exchangeName;
  String instrumentType;
  int firstTradeDate;
  int regularMarketTime;
  int gmtoffset;
  String timezone;
  String exchangeTimezoneName;
  double regularMarketPrice;
  double chartPreviousClose;
  double? previousClose;
  int? scale;
  int priceHint;
  CurrentTradingPeriod currentTradingPeriod;
  List<List<Post>>? tradingPeriods;
  String dataGranularity;
  String range;
  List<String> validRanges;

  factory Meta.fromJson(Map<String, dynamic> json) => Meta(
        currency: json["currency"],
        symbol: json["symbol"],
        exchangeName: json["exchangeName"],
        instrumentType: json["instrumentType"],
        firstTradeDate: json["firstTradeDate"],
        regularMarketTime: json["regularMarketTime"],
        gmtoffset: json["gmtoffset"],
        timezone: json["timezone"],
        exchangeTimezoneName: json["exchangeTimezoneName"],
        regularMarketPrice: json["regularMarketPrice"].toDouble(),
        chartPreviousClose: json["chartPreviousClose"].toDouble(),
        previousClose: json["previousClose"] == null
            ? null
            : json["previousClose"].toDouble(),
        scale: json["scale"] == null ? null : json["scale"],
        priceHint: json["priceHint"],
        currentTradingPeriod:
            CurrentTradingPeriod.fromJson(json["currentTradingPeriod"]),
        tradingPeriods: json["tradingPeriods"] == null
            ? null
            : List<List<Post>>.from(json["tradingPeriods"]
                .map((x) => List<Post>.from(x.map((x) => Post.fromJson(x))))),
        dataGranularity: json["dataGranularity"],
        range: json["range"],
        validRanges: List<String>.from(json["validRanges"].map((x) => x)),
      );
}