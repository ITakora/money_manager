import 'package:flutter/material.dart';

class IndicatorWidget extends StatelessWidget {
  const IndicatorWidget({super.key, required this.color, required this.title});

  final Color? color;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(
          backgroundColor: color ?? Colors.cyan,
          radius: 17,
        ),
        SizedBox(
          width: 10,
        ),
        Text(title),
      ],
    );
  }
}
