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