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
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ChartWidget(),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(top: 20, left: 42),
                child: Column(
                  children: [
                    IndicatorWidget(
                      title: "Food 50%",
                      color: Colors.green,
                    ),
                    SizedBox(height: 10),
                    IndicatorWidget(
                      title: "Transport 50%",
                      color: Colors.grey,
                    ),
                    SizedBox(height: 10),
                    IndicatorWidget(
                      title: "Parts 50%",
                      color: Colors.cyan,
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
