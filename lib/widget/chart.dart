import 'package:flutter/material.dart';
import 'package:flutter_budget_app/models/tranaction.dart';
import 'package:flutter_budget_app/widget/chart_bar.dart';
import 'package:intl/intl.dart';

class Chart extends StatelessWidget {
  List<Transaction> recetTransactions;
  Chart(this.recetTransactions);
  List<Map<String, Object>> get groupeItemValues {
    return List.generate(7, (index) {
      final weekDay = DateTime.now().subtract(
        Duration(days: index),
      );
      var totalSum = 0.0;

      for (var i = 0; i < recetTransactions.length; i++) {
        Transaction item = recetTransactions[i];

        if (item.date.day == weekDay.day &&
            item.date.month == weekDay.month &&
            item.date.year == weekDay.year) {
          totalSum += item.amount;
        }
      }
      return {
        'day': DateFormat.E().format(weekDay).substring(0, 1),
        'amount': totalSum,
      };
    });
  }

  double get _spedingAmountTotal {
    return groupeItemValues.fold(
        0.0, (sum, element) => sum + (element['amount'] as double));
  }

  @override
  Widget build(BuildContext context) {
    print(groupeItemValues);
    return Card(
      elevation: 6,
      margin: EdgeInsets.all(20),
      child: Row(
        children: groupeItemValues
            .map(
              (e) => ChartBar(e['day'] as String, e['amount'] as double,
                  ((e['amount'] as double) / _spedingAmountTotal)),
            )
            .toList(),
      ),
    );
  }
}
