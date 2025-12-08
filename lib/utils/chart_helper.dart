import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:money_manager/enums/expense_enum.dart';
import 'package:money_manager/models/expense_model.dart';

Map<ExpenseTypes, double> calculateTotalCategory(List<ExpenseModel> expenses) {
  final Map<ExpenseTypes, double> total = {};

  for (final expense in expenses) {
    final category = expense.category;
    final amount = double.tryParse(expense.money) ?? 0.0;

    if (category != null) {
      total.update(category!, (value) => value + amount,
          ifAbsent: () => amount);
    }
  }

  return total;
}

List<PieChartSectionData> buildChartSection(
    Map<ExpenseTypes, double> categoryTotal) {
  final List<PieChartSectionData> section = [];

  final double grandTotal =
      categoryTotal.values.fold(0.0, (sum, amount) => sum + amount);

  int colorIndex = 0;

  const List<MaterialColor> sectionColors = [
    Colors.red,
    Colors.blue,
    Colors.orange,
    Colors.purple,
    Colors.teal,
    Colors.brown,
  ];

  categoryTotal.forEach((category, totalAmount) {
    if (grandTotal == 0.0) return;

    final double percentage = (totalAmount / grandTotal) * 100;

    final color = sectionColors[colorIndex % sectionColors.length];
    colorIndex++;

    section.add(
      PieChartSectionData(
        value: percentage,
        color: color,
        title: "${percentage.toStringAsFixed(0)}%\n ${category.name}",
        radius: 90,
        titleStyle: GoogleFonts.poppins(
          fontSize: 12,
          fontWeight: FontWeight.w600,
          color: Colors.white,
        ),
      ),
    );
  });

  return section;
}
