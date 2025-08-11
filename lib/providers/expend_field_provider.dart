import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:money_manager/enums/enum_category.dart';

class ExpendFieldState {
  final String date;
  final String money;
  final Category? category;
  final String description;

  ExpendFieldState({
    this.date = '',
    this.money = '',
    this.category,
    this.description = '',
  });

  ExpendFieldState copyWith({
    String? date,
    String? money,
    Category? category,
    String? description,
  }) {
    return ExpendFieldState(
      date: date ?? this.date,
      money: money ?? this.money,
      category: category ?? this.category,
      description: description ?? this.description,
    );
  }
}

class ExpendFieldNotifier extends StateNotifier<ExpendFieldState> {
  ExpendFieldNotifier() : super(ExpendFieldState());

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

final expendFieldProvider =
    StateNotifierProvider<ExpendFieldNotifier, ExpendFieldState>(
  (ref) => ExpendFieldNotifier(),
);
