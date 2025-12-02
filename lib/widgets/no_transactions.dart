import 'package:flutter/material.dart';

class NoTransactions extends StatelessWidget {
  const NoTransactions({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          "No transactions are added yet!",
          style: Theme.of(context).textTheme.titleMedium,
        ),
        SizedBox(height: 20),
        SizedBox(
          height: 200,
          child: Image.asset(
            "assets/images/no_transactions.png",
            fit: BoxFit.cover,
          ),
        ),
      ],
    );
  }
}
