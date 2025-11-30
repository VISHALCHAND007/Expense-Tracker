import 'package:expense_tracker/transaction.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State {
  //temporary data of transactions
  final List<Transaction> transactions = [
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
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: Text(
            "Expense tracker",
            style: TextStyle(
              color: Theme.of(context).colorScheme.inverseSurface,
            ),
          ),
        ),
        body: Column(
          crossAxisAlignment: .stretch,
          children: [
            Container(
              margin: EdgeInsets.all(10),
              child: Card(child: Text("Chart will come here")),
            ),
            Column(
              children: [
                ...transactions.map((trans) {
                  return Card(
                    child: Row(
                      children: [
                        Container(
                          margin: EdgeInsets.symmetric(
                            vertical: 10,
                            horizontal: 15,
                          ),
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.purple, width: 2),
                          ),
                          padding: EdgeInsets.all(10),
                          child: Text(
                            "₹${trans.amount}",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.purple,
                            ),
                          ),
                        ),
                        Column(
                          crossAxisAlignment: .start,
                          children: [
                            Text(
                              trans.title,
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              DateFormat.yMMMEd().format(trans.date),
                              style: TextStyle(color: Colors.grey),
                            ),
                          ],
                        ),
                      ],
                    ),
                  );
                }),
              ],
            ),
            Card(
              child: Container(
                padding: EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: .end,
                  children: [
                    TextField(
                      decoration: InputDecoration(label: Text("Title")),
                    ),
                    TextField(
                      decoration: InputDecoration(label: Text("Amount")),
                    ),
                    TextButton(
                      onPressed: () {},
                      child: Text(
                        "Add Transaction",
                        style: TextStyle(color: Colors.deepPurple),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
