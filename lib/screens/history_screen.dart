import 'package:flutter/material.dart';
import 'package:money_manager/widgets/chart_widget.dart';
import 'package:money_manager/widgets/indicator_widget.dart';

class HistoryScreen extends StatelessWidget {
  const HistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 40, left: 10),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ChartWidget(),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(top: 20, left: 42),
                child: Column(
                  children: [
                    IndicatorWidget(
                      title: "Food 50%",
                      color: Colors.green,
                    ),
                    SizedBox(height: 10),
                    IndicatorWidget(
                      title: "Transport 50%",
                      color: Colors.grey,
                    ),
                    SizedBox(height: 10),
                    IndicatorWidget(
                      title: "Parts 50%",
                      color: Colors.cyan,
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
