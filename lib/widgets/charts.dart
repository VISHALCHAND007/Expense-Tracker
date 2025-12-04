import 'package:expense_tracker/widgets/chart_bar.dart';
import 'package:intl/intl.dart';

import '../models/transaction.dart';
import 'package:flutter/material.dart';

class Charts extends StatelessWidget {
  final List<Transaction> recentTransactions;
  const Charts({super.key, required this.recentTransactions});

  List<Map<String, Object>> get groupedTransactionsValues {
    return List.generate(7, (index) {
      final weekDay = DateTime.now().subtract(Duration(days: index));
      var totalDaySum = 0.0;

      for (var i = 0; i < recentTransactions.length; i++) {
        var transaction = recentTransactions[i];
        if (transaction.date.day == weekDay.day &&
            transaction.date.year == weekDay.year &&
            transaction.date.month == weekDay.month) {
          totalDaySum += transaction.amount;
        }
      }
      return {
        "day": DateFormat.E().format(weekDay).substring(0, 1),
        "amount": totalDaySum,
      };
    }).reversed.toList();
  }

  double get totalSpending {
    return groupedTransactionsValues.fold(0.0, (sum, item) {
      return sum + (item["amount"] as double);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 6,
      margin: const EdgeInsets.all(10),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Row(
          mainAxisAlignment: .spaceAround,
          children: [
            ...groupedTransactionsValues.map((transaction) {
              return Flexible(
                fit: FlexFit.tight,
                child: ChartBar(
                  day: transaction["day"].toString(),
                  expenseAmount: double.parse(transaction["amount"].toString()),
                  spentPerOfTotal: totalSpending == 0.0
                      ? 0.0
                      : (transaction["amount"] as double) / totalSpending,
                ),
              );
            }),
          ],
        ),
      ),
    );
  }
}
