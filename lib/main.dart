import 'package:expense_tracker/widgets/charts.dart';
import 'package:expense_tracker/widgets/transactions_list.dart';
import 'package:intl/intl.dart';
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
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.lightGreen,
          titleTextStyle: TextStyle(
            fontFamily: "Poppins",
            fontSize: 20,
            color: Theme.of(context).colorScheme.inverseSurface,
          ),
        ),
        textTheme: TextTheme(titleMedium: TextStyle(fontFamily: "Poppins")),
        buttonTheme: ButtonThemeData(buttonColor: Colors.white),
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
  //temporary data of transactions
  final List<Transaction> _transactions = [
    Transaction(
      id: "d1",
      title: "New Laptop",
      amount: 56897.99,
      date: DateTime.now().subtract(Duration(days: 4)),
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
    Transaction(
      id: "d4",
      title: "Amazon order",
      amount: 24457,
      date: DateTime.now().subtract(Duration(days: 2)),
    ),
  ];

  void _addNewTransaction(String title, double amount, DateTime date) {
    var newTransaction = Transaction(
      id: DateTime.now().millisecond.toString(),
      title: title,
      amount: amount,
      date: date,
    );

    setState(() {
      _transactions.add(newTransaction);
    });
  }

  void _deleteTransaction(String id) {
    setState(() {
      _transactions.removeWhere((transaction) => transaction.id == id);
    });
  }

  void _startAddTransactionsBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (ctx) {
        return AddTransactions(addTransaction: _addNewTransaction);
      },
    );
  }

  List<Transaction> get _recentTransactions {
    return _transactions.where((transaction) {
      return transaction.date.isAfter(
        DateTime.now().subtract(Duration(days: 7)),
      );
    }).toList();
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
        title: Text("Expense Tracker"),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: .stretch,
          children: [
            Charts(recentTransactions: _recentTransactions),
            TransactionsList(
              _transactions,
              deleteTransaction: _deleteTransaction,
            ),
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
