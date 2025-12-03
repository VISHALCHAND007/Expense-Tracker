import 'package:flutter/material.dart';

class Horizontalspacer extends StatelessWidget {
  final double height;
  const Horizontalspacer(this.height, {super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(height: height);
  }
}
