import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';
import 'package:money_manager/models/expense_model.dart';
import 'package:money_manager/models/income_model.dart';
import 'package:money_manager/providers/db_expense_provider.dart';
import 'package:money_manager/providers/db_income_provider.dart';

final selectedMonthProvider = StateProvider<DateTime>((ref) => DateTime.now());

final listDropdownProvider = Provider<List<DateTime>>((ref) {
  final allExpenses = ref.watch(trackMoneyExpenseProvider);
  final allIncomes = ref.watch(trackMoneyIncomeProvider);

  final Set<String> uniqueDatesMonth = {};
  final List<DateTime> filterMonths = [];

  for (var item in [...allExpenses, ...allIncomes]) {
    final date = DateTime.parse(item.date);
    final dateString = '${date.year}-${date.month}';
    if (!uniqueDatesMonth.contains(dateString)) {
      uniqueDatesMonth.add(dateString);
      filterMonths.add(date);
    }
  }

  filterMonths.sort((a, b) => b.compareTo(a));

  return filterMonths;
});

final filterMonthlyProvider =
    Provider<({List<ExpenseModel> expenses, List<IncomeModel> incomes})>((ref) {
  final allExpenses = ref.watch(trackMoneyExpenseProvider);
  final allIncomes = ref.watch(trackMoneyIncomeProvider);
  final selectedDate = ref.watch(selectedMonthProvider);

  final filteredExpenses = allExpenses.where((e) {
    final date = DateTime.parse(e.date);
    return date.year == selectedDate.year && date.month == selectedDate.month;
  }).toList();

  final filteredIncomes = allIncomes.where((e) {
    final date = DateTime.parse(e.date);
    return date.year == selectedDate.year && date.month == selectedDate.month;
  }).toList();

  return (expenses: filteredExpenses, incomes: filteredIncomes);
});
