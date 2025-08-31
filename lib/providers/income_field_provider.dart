import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:money_manager/enums/expense_enum.dart';
import 'package:money_manager/enums/income_enum.dart';
import 'package:money_manager/models/expense_model.dart';
import 'package:money_manager/models/income_model.dart';

class IncomeFieldNotifier extends StateNotifier<IncomeModel> {
  IncomeFieldNotifier() : super(IncomeModel());

  void setDate(String date) {
    state = state.copyWith(date: date);
  }

  void setMoney(String money) {
    state = state.copyWith(money: money);
  }

  void setCategory(IncomeTypes? category) {
    state = state.copyWith(category: category);
  }

  void setDescription(String description) {
    state = state.copyWith(description: description);
  }
}

final incomeFieldProvider = StateNotifierProvider<IncomeFieldNotifier, IncomeModel>(
  (ref) => IncomeFieldNotifier(),
);
