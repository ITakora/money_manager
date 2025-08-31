import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:money_manager/enums/expense_enum.dart';
import 'package:money_manager/models/expense_model.dart';

class ExpendFieldNotifier extends StateNotifier<ExpenseModel> {
  ExpendFieldNotifier() : super(ExpenseModel());

  void setDate(String date) {
    state = state.copyWith(date: date);
  }

  void setMoney(String money) {
    state = state.copyWith(money: money);
  }

  void setCategory(ExpenseTypes? category) {
    state = state.copyWith(category: category);
  }

  void setDescription(String description) {
    state = state.copyWith(description: description);
  }
}

final expendFieldProvider = StateNotifierProvider<ExpendFieldNotifier, ExpenseModel>(
  (ref) => ExpendFieldNotifier(),
);
