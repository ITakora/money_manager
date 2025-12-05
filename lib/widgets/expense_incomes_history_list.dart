import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:money_manager/models/expense_income_model.dart';
import 'package:money_manager/models/expense_model.dart';
import 'package:money_manager/models/income_model.dart';
import 'package:money_manager/utils/date_formatted.dart';
import 'package:money_manager/utils/money_formatted.dart';

class ExpenseIncomesHistoryList extends StatelessWidget {
  const ExpenseIncomesHistoryList(
      {super.key, required this.dataIncome, required this.dataExpense});

  final List<IncomeModel> dataIncome;
  final List<ExpenseModel> dataExpense;

  @override
  Widget build(BuildContext context) {
    final List<ExpenseIncome> combinedList = [...dataIncome, ...dataExpense];
    combinedList.sort(
      (a, b) => b.date.compareTo(a.date),
    );

    return ListView.builder(
      padding: EdgeInsets.only(left: 8, right: 8, top: 7, bottom: 70),
      itemCount: combinedList.length,
      itemBuilder: (context, index) {
        final data = combinedList[index];

        if (data is IncomeModel) {
          return Padding(
            padding: const EdgeInsets.only(bottom: 6),
            child: SizedBox(
              height: 90,
              width: double.infinity,
              child: Card(
                color: Color(0xFF9FE1E1),
                elevation: 2,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 15),
                          child: Text(
                            MoneyFormatted.formatCurrencyToIDR(data.money),
                            style: GoogleFonts.poppins(
                                fontSize: 15, fontWeight: FontWeight.w500),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 15),
                          child: Text(
                            "${data.category?.name.replaceAll('_', ' ')} ${data.category?.unicodeIcon} ",
                            style: GoogleFonts.poppins(fontSize: 13),
                          ),
                        )
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 15),
                      child: Text(
                        DateFormatted.getDateFormatted(data.date) ==
                                DateFormatted.getTodayFormatted()
                            ? "Hari Ini"
                            : DateFormatted.getDateFormatted(data.date),
                        style: GoogleFonts.poppins(
                            fontSize: 15, fontWeight: FontWeight.w500),
                      ),
                    )
                  ],
                ),
              ),
            ),
          );
        } else if (data is ExpenseModel) {
          return Padding(
            padding: const EdgeInsets.only(bottom: 6),
            child: SizedBox(
              height: 90,
              width: double.infinity,
              child: Card(
                color: Color(0xFFEA6C84),
                elevation: 2,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 15),
                          child: Text(
                            MoneyFormatted.formatCurrencyToIDR(data.money),
                            style: GoogleFonts.poppins(
                                fontSize: 15, fontWeight: FontWeight.w500),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 15),
                          child: Text(
                            "${data.category?.name} ${data.category?.unicodeIcon} ",
                            style: GoogleFonts.poppins(fontSize: 13),
                          ),
                        )
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 15),
                      child: Text(
                        DateFormatted.getDateFormatted(data.date) ==
                                DateFormatted.getTodayFormatted()
                            ? "Hari Ini"
                            : DateFormatted.getDateFormatted(data.date),
                        style: GoogleFonts.poppins(
                            fontSize: 15, fontWeight: FontWeight.w500),
                      ),
                    )
                  ],
                ),
              ),
            ),
          );
        }

        return const SizedBox.shrink();
      },
    );
  }
}
