import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:money_manager/screens/money_field_screen.dart';
import 'package:money_manager/widgets/expense_card.dart';
import 'package:money_manager/widgets/income_expense_card.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent_bottom_nav_bar_v2.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(bottom: 15),
        child: FloatingActionButton(
          onPressed: () {
            pushScreenWithoutNavBar(context, MoneyFieldScreen());
          },
          backgroundColor: Color(0xFFFEFEFE),
          child: Icon(
            Icons.add,
            color: Colors.black,
          ),
        ),
      ),
      backgroundColor: Color(0xFFF9F8FA),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
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
          IncomeExpenseCard(),
          Padding(
            padding: const EdgeInsets.only(left: 13, top: 30),
            child: Text(
              "History Akhir - Akhir Ini ",
              style: GoogleFonts.poppins(
                  fontSize: 16, fontWeight: FontWeight.w600),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 13, top: 20),
            child: Text(
              "Hari ini",
              style: GoogleFonts.poppins(),
            ),
          ),
          ExpenseCard()
        ],
      ),
    );
  }
}
