import 'package:expense_tracker/widgets/transactions_list.dart';
import './widgets/add_transactions.dart';
import 'package:flutter/material.dart';
import './models/transaction.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Expense Tracker",
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.lightGreen),
        appBarTheme: AppBarTheme(backgroundColor: Colors.lightGreen),

        // useMaterial3: false,
        // primarySwatch:
      ),
      home: _MyHomePage(),
    );
  }
}

class _MyHomePage extends StatefulWidget {
  @override
  State<_MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<_MyHomePage> {
  void _addNewTransaction(String title, double amount) {
    var newTransaction = Transaction(
      id: DateTime.now().millisecond.toString(),
      title: title,
      amount: amount,
      date: DateTime.now(),
    );

    setState(() {
      _transactions.add(newTransaction);
    });
  }

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

  void _startAddTransactionsBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (ctx) {
        return AddTransactions(addTransaction: _addNewTransaction);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () => _startAddTransactionsBottomSheet(context),
          ),
        ],
        title: Text(
          "Expense Tracker",
          // style: TextStyle(color: Theme.of(context).colorScheme.inverseSurface),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: .stretch,
          children: [
            Container(
              margin: EdgeInsets.all(10),
              child: Card(child: Text("Chart will come here")),
            ),
            TransactionsList(_transactions),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        onPressed: () => _startAddTransactionsBottomSheet(context),
        child: Icon(Icons.add),
      ),
    );
  }
}
