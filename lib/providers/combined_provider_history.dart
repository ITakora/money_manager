import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:money_manager/models/expense_model.dart';
import 'package:money_manager/models/income_model.dart';
import 'package:money_manager/providers/db_income_provider.dart';

import 'db_expense_provider.dart';

final combinedAllMoneyProvider = FutureProvider<
    ({
      List<ExpenseModel> allExpenses,
      List<IncomeModel> allIncomes
    })>((ref) async {
  // Wait until both providers finish loading their data
  await Future.wait([
    ref.read(trackMoneyExpenseProvider.notifier).loadAllDbExpense(),
    ref.read(trackMoneyIncomeProvider.notifier).loadAllDbIncome(),
  ]);

  // Once loaded, watch the state (lists) from the providers
  final expenses = ref.read(trackMoneyExpenseProvider);
  final incomes = ref.read(trackMoneyIncomeProvider);

  return (allExpenses: expenses, allIncomes: incomes);
});
