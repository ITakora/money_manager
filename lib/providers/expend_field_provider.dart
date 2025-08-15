import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:money_manager/enums/enum_category.dart';
import 'package:money_manager/models/money_model.dart';

class ExpendFieldNotifier extends StateNotifier<Money> {
  ExpendFieldNotifier() : super(Money());

  void setDate(String date) {
    state = state.copyWith(date: date);
  }

  void setMoney(String money) {
    state = state.copyWith(money: money);
  }

  void setCategory(Category? category) {
    state = state.copyWith(category: category);
  }

  void setDescription(String description) {
    state = state.copyWith(description: description);
  }
}

final expendFieldProvider = StateNotifierProvider<ExpendFieldNotifier, Money>(
  (ref) => ExpendFieldNotifier(),
);
