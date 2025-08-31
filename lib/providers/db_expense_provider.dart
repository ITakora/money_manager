import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:money_manager/db/init_db.dart';
import 'package:money_manager/models/expense_model.dart';

class TrackMoneyExpense extends StateNotifier<List<ExpenseModel>> {
  TrackMoneyExpense() : super([]);

  // Expense related methods
  Future<void> loadDbExpense() async {
    final db = await initDb();
    final List<Map<String, dynamic>> data = await db.query('expense');
    state = data.map((item) => ExpenseModel.fromMap(item)).toList();
  }

  Future<void> getTodayExpense() async {
    DateFormat dateFormat = DateFormat("yyyy-MM-dd");
    final today = dateFormat.format(DateTime.now());
    final db = await initDb();
    final List<Map<String, dynamic>> data = await db.query(
      'expense',
      where: 'date = ?',
      whereArgs: [today],
    );
    state = data.map((item) => ExpenseModel.fromMap(item)).toList();
  }

  void addExpense(ExpenseModel money) async {
    state = [...state, money];
    final db = await initDb();
    await db.insert('expense', money.toMap());
  }

  void deleteExpense(String id) async {
    state = state.where((item) => item.id != id).toList();
    final db = await initDb();
    await db.delete('expense', where: 'id = ?', whereArgs: [id]);
  }
}

final trackMoneyExpenseProvider =
    StateNotifierProvider<TrackMoneyExpense, List<ExpenseModel>>(
  (ref) => TrackMoneyExpense(),
);
