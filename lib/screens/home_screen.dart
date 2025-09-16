import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:money_manager/models/expense_model.dart';
import 'package:money_manager/models/income_model.dart';
import 'package:money_manager/providers/combined_provider_history.dart';
import 'package:money_manager/providers/combined_provider_home.dart';
import 'package:money_manager/providers/db_income_provider.dart';
import 'package:money_manager/screens/money_field_screen.dart';
import 'package:money_manager/widgets/balance_widget.dart';
import 'package:money_manager/widgets/income_expense_card.dart';
import 'package:money_manager/widgets/today_list_widget.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent_bottom_nav_bar_v2.dart';

import '../providers/db_expense_provider.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  String formatCurrency(int amount) {
    final formatter = NumberFormat.currency(
      locale: 'id_ID', // Indonesian locale
      symbol: 'Rp ', // Currency symbol
      decimalDigits: 0, // No decimal places
    );
    return formatter.format(amount);
  }

  @override
  Widget build(BuildContext context) {
    final getTodayData = ref.watch(combinedMoneyProvider);
    final getAllData = ref.watch(combinedAllMoneyProvider);

    final List<ExpenseModel> expenseData = ref.watch(trackMoneyExpenseProvider);
    final List<IncomeModel> incomeData = ref.watch(trackMoneyIncomeProvider);

    return Scaffold(
        floatingActionButton: Padding(
          padding: const EdgeInsets.only(bottom: 15),
          child: FloatingActionButton(
            onPressed: () async {
              await pushScreenWithoutNavBar(context, MoneyFieldScreen());
            },
            backgroundColor: Color(0xFFFEFEFE),
            child: Icon(
              Icons.add,
              color: Colors.black,
            ),
          ),
        ),
        backgroundColor: Color(0xFFF9F8FA),
        body: getAllData.when(
          data: (data) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                BalanceWidget(
                  expenseData: data.allExpenses,
                  incomeData: data.allIncomes,
                ),
                IncomeExpenseCard(
                  expenseData: data.allExpenses,
                  incomeData: data.allIncomes,
                ),
                Center(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 30),
                    child: Text(
                      "Hari ini",
                      textAlign: TextAlign.center,
                      style: GoogleFonts.poppins(
                          fontSize: 16, fontWeight: FontWeight.w600),
                    ),
                  ),
                ),
                getTodayData.when(
                  data: (data) {
                    return Expanded(
                      child: TodayListWidget(
                        expenseData: data.expenses,
                        incomeData: data.incomes,
                      ),
                    );
                  },
                  error: (error, stackTrace) => Center(
                    child: Text(
                      error.toString(),
                      style: GoogleFonts.poppins(),
                    ),
                  ),
                  loading: () => Center(
                    child: CircularProgressIndicator(),
                  ),
                )
              ],
            );
          },
          error: (error, stackTrace) => Center(
            child: Text(
              error.toString(),
              style: GoogleFonts.poppins(),
            ),
          ),
          loading: () => Center(
            child: CircularProgressIndicator(),
          ),
        ));
  }
}
