import 'dart:io';
import 'package:expense_tracker/widgets/charts.dart';
import 'package:expense_tracker/widgets/transactions_list.dart';
import 'package:flutter/cupertino.dart';
// import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import './models/transaction.dart';
import './widgets/add_transactions.dart';

void main() {
  // WidgetsFlutterBinding.ensureInitialized();
  // SystemChrome.setPreferredOrientations([
  //   DeviceOrientation.portraitUp,
  //   DeviceOrientation.portraitDown,
  // ]);
  runApp(MyApp());
}

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
  bool _showCharts = false;

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
    final PreferredSizeWidget appBar = Platform.isAndroid
        ? AppBar(
            actions: [
              IconButton(
                icon: const Icon(Icons.add),
                onPressed: () => _startAddTransactionsBottomSheet(context),
              ),
            ],
            title: const Text("Expense Tracker"),
          )
        : CupertinoNavigationBar(
            middle: const Text("Expense Tracker"),
            trailing: Row(
              mainAxisSize: .min,
              children: [
                GestureDetector(
                  child: const Icon(CupertinoIcons.add),
                  onTap: () => _startAddTransactionsBottomSheet(context),
                ),
              ],
            ),
          );
    final mediaQuery = MediaQuery.of(context);
    final actualBodyHeight =
        mediaQuery.size.height -
        appBar.preferredSize.height -
        mediaQuery.padding.top; // statusbar height
    final isLandscape = mediaQuery.orientation == Orientation.landscape;
    final txListWidget = SizedBox(
      height: actualBodyHeight * .7,
      child: TransactionsList(
        _transactions,
        deleteTransaction: _deleteTransaction,
      ),
    );
    final appBody = SafeArea(
      child: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          crossAxisAlignment: .stretch,
          children: [
            if (isLandscape)
              Row(
                mainAxisAlignment: .spaceBetween,
                children: [
                  Text(
                    "Show chart:",
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  Switch.adaptive(
                    value: _showCharts,
                    onChanged: (val) {
                      setState(() {
                        _showCharts = val;
                      });
                    },
                  ),
                ],
              ),
            if (isLandscape)
              _showCharts
                  ? SizedBox(
                      height: actualBodyHeight * .7,
                      child: Charts(recentTransactions: _recentTransactions),
                    )
                  : txListWidget,

            //portrait mode
            if (!isLandscape)
              SizedBox(
                height: actualBodyHeight * .3,
                child: Charts(recentTransactions: _recentTransactions),
              ),
            if (!isLandscape) txListWidget,
          ],
        ),
      ),
    );

    return Platform.isAndroid
        ? Scaffold(
            appBar: appBar,
            body: appBody,
            floatingActionButtonLocation:
                FloatingActionButtonLocation.centerFloat,
            floatingActionButton: Platform.isIOS
                ? Container()
                : FloatingActionButton(
                    onPressed: () => _startAddTransactionsBottomSheet(context),
                    child: const Icon(Icons.add),
                  ),
          )
        : CupertinoPageScaffold(
            navigationBar: appBar as ObstructingPreferredSizeWidget,
            child: appBody,
          );
  }
}
