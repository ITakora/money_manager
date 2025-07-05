import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:money_manager/widgets/income_expense_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(top: 80, bottom: 20),
            child: Center(
                child: Column(
              children: [
                Text(
                  "Rp. 100.000",
                  style: GoogleFonts.poppins(
                      fontSize: 28, fontWeight: FontWeight.w600),
                ),
                SizedBox(
                  height: 10,
                ),
                Text("Total Balance")
              ],
            )),
          ),
          IncomeExpenseCard()
        ],
      ),
    );
  }
}
