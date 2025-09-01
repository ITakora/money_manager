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
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 15, top: 10),
          child: Text("Pengeluaran" ,style: GoogleFonts.poppins(
              )),
        ),
        SizedBox(height: 10),
        ExpenseListview(data: expenseData),
        SizedBox(height: 10),
        Padding(
          padding: const EdgeInsets.only(left: 15, top: 6),
          child: Text("Pendapatan" ,style: GoogleFonts.poppins(
              )),
        ),
        SizedBox(height: 10),
        IncomeListview(data: incomeData),

      ],
    );
  }
}
