import 'package:expense_tracker/models/transaction.dart';
import 'package:expense_tracker/widgets/no_transactions.dart';
import 'package:flutter/material.dart';

import './transaction_item.dart';

class TransactionsList extends StatelessWidget {
  final List<Transaction> transactions;
  final Function(String id) deleteTransaction;

  const TransactionsList(
    this.transactions, {
    super.key,
    required this.deleteTransaction,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      // height: 400,
      padding: const EdgeInsets.only(top: 10),
      child: transactions.isEmpty
          ? NoTransactions()
          : ListView(
              children: transactions.map((tx) {
                return TransactionItem(
                  key: ValueKey(tx.id),
                  transaction: tx,
                  deleteTransaction: deleteTransaction,
                );
              }).toList(),
            ),
      // : ListView.builder(
      //     // reverse: true,
      //     itemCount: transactions.length,
      //     itemBuilder: (context, ind) {
      //       return TransactionItem(
      //         key: ValueKey(transactions[ind].id),
      //         transaction: transactions[ind],
      //         deleteTransaction: deleteTransaction,
      //       );
      //     },
      //   ),
    );
  }
}



//old self make transaction list card

   // Card(
                //   child: Row(
                //     children: [
                //       Container(
                //         margin: EdgeInsets.symmetric(
                //           vertical: 10,
                //           horizontal: 15,
                //         ),
                //         decoration: BoxDecoration(
                //           border: Border.all(
                //             color: Theme.of(context).colorScheme.primary,
                //             width: 2,
                //           ),
                //         ),
                //         padding: EdgeInsets.all(10),
                //         child: Text(
                //           "₹${transactions[ind].amount.toStringAsFixed(2)}",
                //           style: TextStyle(
                //             fontSize: 18,
                //             fontWeight: FontWeight.bold,
                //             color: Theme.of(context).colorScheme.primary,
                //           ),
                //         ),
                //       ),
                //       Column(
                //         crossAxisAlignment: .start,
                //         children: [
                //           Text(
                //             transactions[ind].title,
                //             style: Theme.of(context).textTheme.titleMedium,
                //           ),
                //           Text(
                //             DateFormat.yMMMEd().format(transactions[ind].date),
                //             style: TextStyle(color: Colors.grey),
                //           ),
                //         ],
                //       ),
                //     ],
                //   ),
                // );
