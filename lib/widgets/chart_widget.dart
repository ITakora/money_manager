import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ChartWidget extends StatelessWidget {
  const ChartWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        height: 190,
        child: PieChart(PieChartData(sections: [
          PieChartSectionData(
              value: 30,
              color: Colors.green,
              title: "Food",
              titleStyle: GoogleFonts.poppins(
                  fontSize: 12, fontWeight: FontWeight.w600)),
          PieChartSectionData(
              value: 20,
              color: Colors.cyan,
              titleStyle: GoogleFonts.poppins(
                  fontSize: 12, fontWeight: FontWeight.w600)),
          PieChartSectionData(
              value: 50,
              color: Colors.grey,
              titleStyle: GoogleFonts.poppins(
                  fontSize: 12, fontWeight: FontWeight.w600))
        ])),
      ),
    );
  }
}
