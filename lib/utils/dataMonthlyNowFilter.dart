import 'package:money_manager/models/expense_model.dart';
import 'package:money_manager/models/income_model.dart';

class DataMonthlyNowFilter {
  static List<IncomeModel> filterCurrentMonthIncome(
      List<IncomeModel> incomeData) {
    final dateNow = DateTime.now();
    return incomeData.where((e) {
      final date = DateTime.parse(e.date);
      return date.year == dateNow.year && date.month == dateNow.month;
    }).toList();
  }

  static List<ExpenseModel> filterCurrentMonthExpense(
      List<ExpenseModel> expenseData) {
    final dateNow = DateTime.now();
    return expenseData.where((e) {
      final date = DateTime.parse(e.date);
      return date.year == dateNow.year && date.month == dateNow.month;
    }).toList();
  }
}
