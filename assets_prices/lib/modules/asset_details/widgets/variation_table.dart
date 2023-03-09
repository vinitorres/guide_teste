import 'package:assets_prices/helpers/date_format.dart';
import 'package:assets_prices/helpers/values_helper.dart';
import 'package:assets_prices/models/financial_asset.dart';
import 'package:flutter/material.dart';

class VariationTable extends StatelessWidget {
  const VariationTable({super.key, required this.financialAsset});

  final FinancialAsset financialAsset;

  final TextStyle style = const TextStyle(
      color: Colors.black, fontWeight: FontWeight.bold, fontSize: 8);
  final defaultPadding = const EdgeInsets.all(4.0);

  List<TableRow> createTable(
    List<DateTime> dates,
    List<double> quotesOpening,
    List<double> variationMinusOne,
    List<double> variationFirstDay,
  ) {
    List<TableRow> rows = <TableRow>[];

    rows.add(TableRow(children: [
      Center(child: Text("Dia", style: style)),
      Center(child: Text("Data", style: style)),
      Center(child: Text("Valor", style: style)),
      Center(
          child:
              Text("variação D-1", textAlign: TextAlign.center, style: style)),
      Center(
          child: Text("variação dia 1",
              textAlign: TextAlign.center, style: style)),
    ]));

    for (int i = 0; i < dates.length; i++) {
      TableRow row = TableRow(children: [
        Padding(
          padding: defaultPadding,
          child: Center(child: Text((i + 1).toString(), style: style)),
        ),
        Padding(
          padding: defaultPadding,
          child: Center(
              child: Text(DateFormatHelper.convertToDDMMAA(dates[i]),
                  style: style)),
        ),
        Padding(
          padding: defaultPadding,
          child: Center(
              child: Text(
                  "R\$ ${ValuesHelper.changeDots(ValuesHelper.convertValue2Digits(quotesOpening[i]))}",
                  style: style)),
        ),
        Padding(
          padding: defaultPadding,
          child: Center(
              child: Text(i == 0 ? '-' : variationMinusOne[i].toString() + "%",
                  textAlign: TextAlign.center, style: style)),
        ),
        Padding(
          padding: defaultPadding,
          child: Center(
              child: Text(i == 0 ? '-' : variationFirstDay[i].toString() + "%",
                  textAlign: TextAlign.center, style: style)),
        )
      ]);

      rows.add(row);
    }

    return rows;
  }

  @override
  Widget build(BuildContext context) {
    return Table(
      border: TableBorder.all(),
      columnWidths: {
        0: FlexColumnWidth(0.5),
        1: FlexColumnWidth(1.5),
        2: FlexColumnWidth(1.5),
        3: FlexColumnWidth(1.5),
        4: FlexColumnWidth(1.5),
      },
      defaultVerticalAlignment: TableCellVerticalAlignment.middle,
      children: createTable(
        financialAsset.getLast30Dates(),
        financialAsset.getLast30QuotesOpening(),
        ValuesHelper.getPercentToDayMinusOne(financialAsset),
        ValuesHelper.getPercentToFirstDay(financialAsset),
      ),
    );
  }
}
