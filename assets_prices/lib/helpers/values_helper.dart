import 'package:assets_prices/models/financial_asset.dart';

class ValuesHelper {
  static List<double> getPercentToDayMinusOne(FinancialAsset financialAsset) {
    List<double> percents = [];
    List<DateTime> dates = financialAsset.getLast30Dates();
    List<double> quotesOpening = financialAsset.getLast30QuotesOpening();

    for (int i = 0; i < dates.length; i++) {
      if (i == 0) {
        percents.add(0);
      } else {
        percents.add(
            calculatePercentVariation(quotesOpening.first, quotesOpening[i]));
      }
    }

    return percents;
  }

  static List<double> getPercentToFirstDay(FinancialAsset financialAsset) {
    List<double> percents = [];
    double firstDay = financialAsset.getFirstDayValue();
    List<DateTime> dates = financialAsset.getLast30Dates();
    List<double> quotesOpening = financialAsset.getLast30QuotesOpening();

    for (int i = 0; i < dates.length; i++) {
      percents.add(calculatePercentVariation(firstDay, quotesOpening[i]));
    }

    return percents;
  }

  static double calculatePercentVariation(double value, double value2) {
    return convertValue2Digits((value2 - value) / value * 100);
  }

  static double convertValue2Digits(double value) =>
      double.parse(value.toStringAsFixed(2));

  static String changeDots(double value) {
    return value.toString().replaceAll('.', ',');
  }
}
