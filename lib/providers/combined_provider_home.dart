import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:money_manager/models/expense_model.dart';
import 'package:money_manager/models/income_model.dart';
import 'package:money_manager/providers/db_expense_provider.dart';
import 'package:money_manager/providers/db_income_provider.dart';

final combinedMoneyProvider = Provider<({List<ExpenseModel> expenses, List<IncomeModel> incomes})>((ref) {
  final allExpenses = ref.watch(trackMoneyExpenseProvider);
  final allIncomes = ref.watch(trackMoneyIncomeProvider);

  final today = DateTime.now();
  final todayExpenses = allExpenses.where((e) {
    final date = DateTime.parse(e.date);
    return date.year == today.year && date.month == today.month && date.day == today.day;
  }).toList();

  final todayIncomes = allIncomes.where((i) {
    final date = DateTime.parse(i.date);
    return date.year == today.year && date.month == today.month && date.day == today.day;
  }).toList();

  return (expenses: todayExpenses, incomes: todayIncomes);
});