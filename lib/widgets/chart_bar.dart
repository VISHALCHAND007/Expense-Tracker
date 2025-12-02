import 'package:flutter/material.dart';
import 'HorizontalSpacer.dart';

class ChartBar extends StatelessWidget {
  final String day;
  final double expenseAmount;
  final double spentPerOfTotal;

  const ChartBar({
    super.key,
    required this.day,
    required this.expenseAmount,
    required this.spentPerOfTotal,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 20,
          child: FittedBox(
            fit: BoxFit.contain,
            child: Text("₹${expenseAmount.toStringAsFixed(0)}"),
          ),
        ),
        Horizontalspacer(),
        Container(
          height: 60,
          width: 10,
          margin: EdgeInsets.all(10),
          child: Stack(
            children: [
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey, width: 1),
                  color: Color.fromRGBO(220, 220, 220, 1),
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              //top
              FractionallySizedBox(
                heightFactor: spentPerOfTotal,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ),
              ),
            ],
          ),
        ),
        Horizontalspacer(),
        Text(day),
      ],
    );
  }
}
