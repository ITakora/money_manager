import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:money_manager/models/expense_model.dart';
import 'package:money_manager/models/income_model.dart';
import 'package:money_manager/widgets/expense_listview.dart';
import 'package:money_manager/widgets/income_listview.dart';

class TodayListWidget extends StatelessWidget {
  const TodayListWidget(
      {super.key, required this.expenseData, required this.incomeData});

  final List<ExpenseModel> expenseData;
  final List<IncomeModel> incomeData;

  @override
  Widget build(BuildContext context) {
    if (expenseData.isEmpty && incomeData.isEmpty) {
      return Center(
        child: Text(
          "Listnya Masih Kosong Hari ini 😕",
          style: GoogleFonts.poppins(fontSize: 16, fontWeight: FontWeight.w500),
        ),
      );
    }
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(height: 10),
          ExpenseListview(data: expenseData),
          SizedBox(height: 10),
          IncomeListview(data: incomeData),
          SizedBox(height: 80),
        ],
      ),
    );
  }
}
