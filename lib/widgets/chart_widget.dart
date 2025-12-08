import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:money_manager/enums/expense_enum.dart';
import 'package:money_manager/models/expense_model.dart';

import '../utils/chart_helper.dart';

class ChartWidget extends StatelessWidget {
  const ChartWidget({super.key, required this.dataExpense});

  final List<ExpenseModel> dataExpense;

  @override
  Widget build(BuildContext context) {
    final Map<ExpenseTypes, double> categoryTotals =
        calculateTotalCategory(dataExpense);
    final List<PieChartSectionData> sections =
        buildChartSection(categoryTotals);

    return SizedBox(
        height: 250,
        child: PieChart(
          PieChartData(
            sections: sections,
            sectionsSpace: 4,
          ),
          curve: Curves.linear,
        ));
  }
}
