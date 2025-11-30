import './widgets/user_transactions.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: _MyHomePage());
  }
}

class _MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(
          "Expense tracker",
          style: TextStyle(color: Theme.of(context).colorScheme.inverseSurface),
        ),
      ),
      body: Column(
        crossAxisAlignment: .stretch,
        children: [
          Container(
            margin: EdgeInsets.all(10),
            child: Card(child: Text("Chart will come here")),
          ),
          UserTransactions(),
        ],
      ),
    );
  }
}
