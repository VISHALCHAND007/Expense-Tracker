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
    return LayoutBuilder(
      builder: (ctx, constraints) {
        final height = constraints.maxHeight;
        return Column(
          mainAxisAlignment: .center,
          children: [
            SizedBox(
              height: height * .10,
              child: FittedBox(
                fit: BoxFit.contain,
                child: Text("₹${expenseAmount.toStringAsFixed(0)}"),
              ),
            ),
            Horizontalspacer(height * .05),
            Container(
              height: height * .55,
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
            Horizontalspacer(height * .05),
            SizedBox(
              height: height * .10,
              child: FittedBox(child: Text(day)),
            ),
          ],
        );
      },
    );
  }
}
