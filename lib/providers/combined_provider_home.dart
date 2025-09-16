import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:money_manager/models/expense_model.dart';
import 'package:money_manager/models/income_model.dart';
import 'package:money_manager/providers/db_income_provider.dart';

import 'db_expense_provider.dart';

final combinedMoneyProvider =
    FutureProvider<({List<ExpenseModel> expenses, List<IncomeModel> incomes})>(
        (ref) async {
  // Wait until both providers finish loading their data
  await Future.wait([
    ref.read(trackMoneyExpenseProvider.notifier).getTodayExpense(),
    ref.read(trackMoneyIncomeProvider.notifier).getTodayIncome(),
  ]);

  // Once loaded, watch the state (lists) from the providers
  final expenses = ref.watch(trackMoneyExpenseProvider);
  final incomes = ref.watch(trackMoneyIncomeProvider);

  return (expenses: expenses, incomes: incomes);
});
