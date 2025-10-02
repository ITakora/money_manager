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
  void initState() {
    super.initState();
    // Trigger data fetch on init
    Future.microtask(() {

      ref.read(trackMoneyExpenseProvider.notifier).loadAllDbExpense();
      ref.read(trackMoneyIncomeProvider.notifier).loadAllDbIncome();
    });
  }

  @override
  Widget build(BuildContext context) {
    final getTodayData = ref.watch(combinedMoneyProvider);
    final getAllData = ref.watch(combinedAllMoneyProvider);

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
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Remove .when, use data directly
          Column(
            children: [
              BalanceWidget(
                expenseData: getAllData.allExpenses,
                incomeData: getAllData.allIncomes,
              ),
              IncomeExpenseCard(
                expenseData: getAllData.allExpenses,
                incomeData: getAllData.allIncomes,
              ),
            ],
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
          Expanded(
            child: TodayListWidget(
              expenseData: getTodayData.expenses,
              incomeData: getTodayData.incomes,
            ),
          ),
        ],
      ),
    );
  }
}
