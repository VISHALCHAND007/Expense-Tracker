import '../models/transaction.dart';
import 'package:flutter/material.dart';

class AddTransactions extends StatelessWidget {
  final List<Transaction> transactions;
  AddTransactions(this.transactions, {super.key});

  final titleController = TextEditingController();
  final amountController = TextEditingController();

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
            ),
            TextField(
              decoration: InputDecoration(label: Text("Amount")),
              controller: amountController,
              keyboardType: TextInputType.numberWithOptions(),
            ),
            TextButton(
              onPressed: () {
                print(titleController.text);
                print(amountController.text);
              },
              child: Text(
                "Add Transaction",
                style: TextStyle(color: Colors.deepPurple),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
