import 'package:flutter/material.dart';

class BottomSheetHead extends StatelessWidget {
  const BottomSheetHead({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 5,
      alignment: Alignment.center,
      margin: EdgeInsets.symmetric(vertical: 20),
      child: Container(
        width: 30,
        decoration: BoxDecoration(
          border: BoxBorder.all(color: Colors.grey, width: 1),
          borderRadius: BorderRadius.circular(30),
          color: Color.fromRGBO(220, 220, 220, 1),
        ),
      ),
    );
  }
}
