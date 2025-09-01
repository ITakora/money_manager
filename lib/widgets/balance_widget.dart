import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:money_manager/models/expense_model.dart';
import 'package:money_manager/models/income_model.dart';

class BalanceWidget extends StatelessWidget {
  const BalanceWidget({super.key, required this.expenseData, required this.incomeData });

final List<IncomeModel> incomeData;
final List<ExpenseModel> expenseData;


  @override
  Widget build(BuildContext context) {
    int totalBalance = 0;
    int incomeAmount = 0;
    int expenseAmount = 0;
    for (int i = 0; i < incomeData.length; i ++) {
      int incomeMoney = int.parse(incomeData[i].money);

      incomeAmount += incomeMoney;

    }

    for (int i = 0; i < expenseData.length; i ++) {
      int expenseMoney = int.parse(expenseData[i].money);

      expenseAmount += expenseMoney;

    }

    totalBalance = incomeAmount - expenseAmount;

    final currencyFormat = NumberFormat.currency(locale: 'id',
        symbol: 'Rp ', decimalDigits: 0);


    return Padding(
      padding: EdgeInsets.only(top: 80, bottom: 20),
      child: Center(
          child: Column(
        children: [
          Text(
            currencyFormat.format(totalBalance),
            style:
                GoogleFonts.poppins(fontSize: 28, fontWeight: FontWeight.w600),
          ),
          SizedBox(
            height: 10,
          ),
          Text("Total Balance")
        ],
      )),
    );
  }
}
