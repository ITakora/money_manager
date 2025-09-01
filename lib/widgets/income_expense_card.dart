import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:money_manager/models/expense_model.dart';
import 'package:money_manager/models/income_model.dart';

class IncomeExpenseCard extends StatelessWidget {
  const IncomeExpenseCard({super.key, required this.incomeData, required this.expenseData});

  final List<IncomeModel> incomeData;
  final List<ExpenseModel> expenseData;



  @override
  Widget build(BuildContext context) {
    int amountIncomeDataMoney = 0;
    int amountExpenseDataMoney = 0;
    for (int i = 0; i < incomeData.length; i++) {

      int dataMoney = int.parse(incomeData[i].money);
      amountIncomeDataMoney += dataMoney;

    }

    for (int i = 0; i < expenseData.length; i++) {

      int dataMoney = int.parse(expenseData[i].money);
      amountExpenseDataMoney += dataMoney;

    }

    final currencyFormat = NumberFormat.currency(locale: 'id',
        symbol: 'Rp ', decimalDigits: 0);
    
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        SizedBox(
          height: 90,
          width: 185,
          child: Card(
              color: Color(0xFF9FE1E1),
              elevation: 3,
              child: Padding(
                padding: EdgeInsets.only(left: 10, top: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Pendapatan",
                      style: GoogleFonts.poppins(),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Text(
                      currencyFormat.format(amountIncomeDataMoney),
                      style: GoogleFonts.poppins(
                          fontSize: 17, fontWeight: FontWeight.w500),
                    )
                  ],
                ),
              )),
        ),
        SizedBox(
          height: 90,
          width: 185,
          child: Card(
            color: Color(0xFFEA6C84),
            elevation: 3,
            child: Padding(
              padding: const EdgeInsets.only(left: 10, top: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Pengeluaran",
                    style: GoogleFonts.poppins(),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Text(
                    currencyFormat.format(amountExpenseDataMoney),
                    style: GoogleFonts.poppins(
                        fontSize: 17, fontWeight: FontWeight.w500),
                  )
                ],
              ),
            ),
          ),
        )
      ],
    );
  }
}
