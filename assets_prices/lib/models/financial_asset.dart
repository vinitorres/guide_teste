class ChartResponse {
  ChartResponse({
    required this.chart,
  });
  Chart chart;

  factory ChartResponse.fromJson(Map<String, dynamic> json) => ChartResponse(
        chart: Chart.fromJson(json["chart"]),
      );
}

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

  double getFirstDayValue() {
    return this.indicators.quote.first.open.first;
  }
}

class Indicators {
  Indicators({
    required this.quote,
  });

  List<Quote> quote;

  factory Indicators.fromJson(Map<String, dynamic> json) => Indicators(
        quote: List<Quote>.from(json["quote"].map((x) => Quote.fromJson(x))),
      );
}

class Quote {
  Quote({
    required this.volume,
    required this.open,
    required this.high,
    required this.close,
    required this.low,
  });

  List<int> volume;
  List<double> open;
  List<double> high;
  List<double> close;
  List<double> low;

  factory Quote.fromJson(Map<String, dynamic> json) => Quote(
        volume: List<int>.from(json["volume"].map((x) => x)),
        open: List<double>.from(json["open"].map((x) => x.toDouble())),
        high: List<double>.from(json["high"].map((x) => x.toDouble())),
        close: List<double>.from(json["close"].map((x) => x.toDouble())),
        low: List<double>.from(json["low"].map((x) => x.toDouble())),
      );
}

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

class CurrentTradingPeriod {
  CurrentTradingPeriod({
    required this.pre,
    required this.regular,
    required this.post,
  });

  Post pre;
  Post regular;
  Post post;

  factory CurrentTradingPeriod.fromJson(Map<String, dynamic> json) =>
      CurrentTradingPeriod(
        pre: Post.fromJson(json["pre"]),
        regular: Post.fromJson(json["regular"]),
        post: Post.fromJson(json["post"]),
      );
}

class Post {
  Post({
    required this.timezone,
    required this.start,
    required this.end,
    required this.gmtoffset,
  });

  String timezone;
  int start;
  int end;
  int gmtoffset;

  factory Post.fromJson(Map<String, dynamic> json) => Post(
        timezone: json["timezone"],
        start: json["start"],
        end: json["end"],
        gmtoffset: json["gmtoffset"],
      );
}
