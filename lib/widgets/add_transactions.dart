import 'package:flutter/material.dart';

class AddTransactions extends StatefulWidget {
  final Function(String, double) addTransaction;

  AddTransactions({required this.addTransaction, super.key});

  @override
  State<AddTransactions> createState() => _AddTransactionsState();
}

class _AddTransactionsState extends State<AddTransactions> {
  final titleController = TextEditingController();

  final amountController = TextEditingController();

  void _submitTransaction() {
    final enteredTitle = titleController.text;
    final enteredAmount = amountController.text;

    if (enteredTitle.isEmpty || enteredAmount.isEmpty) return;

    final parsedAmount = double.parse(amountController.text);
    widget.addTransaction(enteredTitle, parsedAmount);
    //closing bottom sheet
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: .end,
          children: [
            TextField(
              decoration: InputDecoration(label: Text("Title")),
              controller: titleController,
              onSubmitted: (_) => _submitTransaction(),
            ),
            TextField(
              decoration: InputDecoration(label: Text("Amount")),
              controller: amountController,
              keyboardType: TextInputType.numberWithOptions(),
              onSubmitted: (_) => _submitTransaction(),
            ),
            TextButton(
              onPressed: _submitTransaction,
              child: Text(
                "Add Transaction",
                style: TextStyle(color: Theme.of(context).primaryColor),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
