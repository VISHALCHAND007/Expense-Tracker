import 'package:expense_tracker/models/transaction.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TransactionsList extends StatelessWidget {
  final List<Transaction> transactions;

  const TransactionsList(this.transactions, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 400,
      padding: EdgeInsets.only(top: 10),
      child: ListView.builder(
        // reverse: true,
        itemCount: transactions.length,
        itemBuilder: (context, ind) {
          return Card(
            child: Row(
              children: [
                Container(
                  margin: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Theme.of(context).colorScheme.primary,
                      width: 2,
                    ),
                  ),
                  padding: EdgeInsets.all(10),
                  child: Text(
                    "₹${transactions[ind].amount.toStringAsFixed(2)}",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                ),
                Column(
                  crossAxisAlignment: .start,
                  children: [
                    Text(
                      transactions[ind].title,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      DateFormat.yMMMEd().format(transactions[ind].date),
                      style: TextStyle(color: Colors.grey),
                    ),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
