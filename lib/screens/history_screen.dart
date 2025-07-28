import 'package:flutter/material.dart';
import 'package:money_manager/widgets/chart_widget.dart';
import 'package:money_manager/widgets/indicator_widget.dart';

class HistoryScreen extends StatelessWidget {
  const HistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 30),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ChartWidget(),
            Column(
              children: [IndicatorWidget()],
            )
          ],
        ),
      ),
    );
  }
}
