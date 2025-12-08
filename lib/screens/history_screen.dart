import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:money_manager/providers/all_provider_data.dart';
import 'package:money_manager/widgets/chart_widget.dart';
import 'package:money_manager/widgets/expense_incomes_history_list.dart';

class HistoryScreen extends ConsumerStatefulWidget {
  const HistoryScreen({super.key});

  @override
  ConsumerState createState() => _HistoryScreenState();
}

class _HistoryScreenState extends ConsumerState<HistoryScreen> {
  @override
  Widget build(BuildContext context) {
    final getAllData = ref.watch(allMoneyProvider);

    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 50, left: 10),
            child: ChartWidget(dataExpense: getAllData.allExpenses),
          ),
          SizedBox(height: 20),
          Expanded(
            child: ExpenseIncomesHistoryList(
                dataIncome: getAllData.allIncomes,
                dataExpense: getAllData.allExpenses),
          )
        ],
      ),
    );
  }
}
