import 'package:flutter/material.dart';

class IndicatorWidget extends StatelessWidget {
  const IndicatorWidget({
    super.key,
  });

  // final Color? color;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(
          backgroundColor: Colors.cyan,
          radius: 17,
        ),
        SizedBox(
          width: 10,
        ),
        Text("Food 25%"),
        SizedBox(
          width: 25,
        )
      ],
    );
  }
}
