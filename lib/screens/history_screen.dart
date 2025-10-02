import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:money_manager/models/expense_model.dart';
import 'package:money_manager/models/income_model.dart';
import 'package:money_manager/providers/db_expense_provider.dart';
import 'package:money_manager/providers/db_income_provider.dart';
import 'package:money_manager/widgets/chart_widget.dart';
import 'package:money_manager/widgets/indicator_widget.dart';

class HistoryScreen extends ConsumerStatefulWidget {
  const HistoryScreen({super.key});

  @override
  ConsumerState createState() => _HistoryScreenState();
}

class _HistoryScreenState extends ConsumerState<HistoryScreen> {
  @override
  Widget build(BuildContext context) {
    final List<ExpenseModel> _expenseData =
        ref.watch(trackMoneyExpenseProvider);
    final List<IncomeModel> _incomeData = ref.watch(trackMoneyIncomeProvider);

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 40, left: 10),
        child:
            ChartWidget(),



      ),
    );
  }
}
