import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:money_manager/models/expense_model.dart';
import 'package:money_manager/models/income_model.dart';
import 'package:money_manager/providers/db_income_provider.dart';

import 'db_expense_provider.dart';

final combinedAllMoneyProvider = Provider<
    ({
      List<ExpenseModel> allExpenses,
      List<IncomeModel> allIncomes
    })>((ref) {
  final expenses = ref.watch(trackMoneyExpenseProvider);
  final incomes = ref.watch(trackMoneyIncomeProvider);

  return (allExpenses: expenses, allIncomes: incomes);
});
