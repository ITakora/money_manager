import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:money_manager/db/init_db.dart';
import 'package:money_manager/models/money_model.dart';

class TrackMoneyIncome extends StateNotifier<List<Money>> {
  TrackMoneyIncome() : super([]);

  // Expense related methods
  Future<void> loadDbIncome() async {
    final db = await initDb();
    final List<Map<String, dynamic>> data = await db.query('income');
    state = data.map((item) => Money.fromMap(item)).toList();
  }

  Future<void> getTodayIncome() async {
    DateFormat dateFormat = DateFormat("yyyy-MM-dd");
    final today = dateFormat.format(DateTime.now());
    final db = await initDb();
    final List<Map<String, dynamic>> data = await db.query(
      'income',
      where: 'date = ?',
      whereArgs: [today],
    );
    state = data.map((item) => Money.fromMap(item)).toList();
  }

  void addIncome(Money money) async {
    state = [...state, money];
    final db = await initDb();
    await db.insert('income', money.toMap());
  }

  void deleteIncome(String id) async {
    state = state.where((item) => item.id != id).toList();
    final db = await initDb();
    await db.delete('income', where: 'id = ?', whereArgs: [id]);
  }
}

final trackMoneyIncomeProvider =
    StateNotifierProvider<TrackMoneyIncome, List<Money>>(
  (ref) => TrackMoneyIncome(),
);
