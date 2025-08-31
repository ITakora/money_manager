import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:money_manager/models/expense_model.dart';
import 'package:money_manager/models/income_model.dart';
import 'package:money_manager/providers/db_income_provider.dart';
import 'package:money_manager/screens/money_field_screen.dart';
import 'package:money_manager/widgets/balance_widget.dart';
import 'package:money_manager/widgets/income_expense_card.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent_bottom_nav_bar_v2.dart';

import '../providers/db_expense_provider.dart';
import '../widgets/expense_list_card.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  late Future<void> _moneyExpenseData;
  late Future<void> _moneyIncomeData;

  @override
  void initState() {
    _moneyExpenseData =
        ref.read(trackMoneyExpenseProvider.notifier).loadDbExpense();
    _moneyIncomeData =
        ref.read(trackMoneyIncomeProvider.notifier).getTodayIncome();
    super.initState();
  }

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
    final List<ExpenseModel> _expenseData = ref.watch(trackMoneyExpenseProvider);
    final List<IncomeModel> _incomeData = ref.watch(trackMoneyIncomeProvider);

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
          BalanceWidget(),
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
          FutureBuilder(
            future: _moneyExpenseData,
            builder: (context, snapshot) =>
                snapshot.connectionState == ConnectionState.waiting
                    ? const Center(
                        child: CircularProgressIndicator(),
                      )
                    : Expanded(
                        child: ExpenseCard(
                          expenseData: _expenseData,
                          incomeData: _incomeData,
                        ),
                      ),
          )
        ],
      ),
    );
  }
}
