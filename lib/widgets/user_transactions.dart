import 'package:flutter/material.dart';
import './add_transactions.dart';
import './transactions_list.dart';
import '../models/transaction.dart';

class UserTransactions extends StatefulWidget {
  const UserTransactions({super.key});

  @override
  State createState() => _UserTransactions();
}

class _UserTransactions extends State<UserTransactions> {
  //temporary data of transactions
  final List<Transaction> _transactions = [
    Transaction(
      id: "d1",
      title: "New Laptop",
      amount: 56897.99,
      date: DateTime.now(),
    ),
    Transaction(
      id: "d2",
      title: "Daily needs",
      amount: 5689,
      date: DateTime.now(),
    ),
    Transaction(
      id: "d3",
      title: "Amazon order",
      amount: 678,
      date: DateTime.now(),
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TransactionsList(_transactions),
        AddTransactions(_transactions),
      ],
    );
  }
}
