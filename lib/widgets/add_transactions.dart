import './bottom_sheet_head.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class AddTransactions extends StatefulWidget {
  final Function(String, double, DateTime) addTransaction;

  const AddTransactions({required this.addTransaction, super.key});

  @override
  State<AddTransactions> createState() => _AddTransactionsState();
}

class _AddTransactionsState extends State<AddTransactions> {
  final titleController = TextEditingController();

  final amountController = TextEditingController();
  final dateController = TextEditingController();
  DateTime selectedDate = DateTime.now();

  void _submitTransaction() {
    final enteredTitle = titleController.text;
    final enteredAmount = amountController.text;
    final enteredDate = dateController.text;

    if (enteredTitle.isEmpty || enteredAmount.isEmpty || enteredDate.isEmpty) {
      return;
    }

    final parsedAmount = double.parse(amountController.text);
    widget.addTransaction(enteredTitle, parsedAmount, selectedDate);
    //closing bottom sheet
    Navigator.of(context).pop();
  }

  void _showDatePickerModal() {
    showDatePicker(
      context: context,
      firstDate: DateTime(2024),
      lastDate: DateTime.now(),
      initialDate: DateTime.now(),
    ).then((selectedDate) {
      if (selectedDate != null) {
        this.selectedDate = selectedDate;
        final formattedDate = DateFormat.yMMMEd().format(selectedDate);
        dateController.text = formattedDate;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.only(
            top: 10,
            right: 10,
            left: 10,
            bottom: MediaQuery.of(context).viewInsets.bottom,
          ),
          child: Column(
            crossAxisAlignment: .end,
            spacing: 20.0,
            children: [
              BottomSheetHead(),
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
              InkWell(
                onTap: () {
                  _showDatePickerModal();
                },
                child: IgnorePointer(
                  child: TextField(
                    readOnly: true,
                    controller: dateController,
                    decoration: InputDecoration(
                      label: Text("Select date"),
                      hint: Text("No date chosen!"),
                      icon: Icon(Icons.calendar_month_outlined),
                    ),
                  ),
                ),
              ),

              FilledButton(
                onPressed: _submitTransaction,
                child: Text("Add Transaction", style: TextStyle(fontSize: 15)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
