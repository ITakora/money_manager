import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:money_manager/enums/enum_category.dart';

class IncomeFieldState {
  final String date;
  final String money;
  final Category? category;
  final String description;

  IncomeFieldState({
    this.date = '',
    this.money = '',
    this.category,
    this.description = '',
  });

  IncomeFieldState copyWith({
    String? date,
    String? money,
    Category? category,
    String? description,
  }) {
    return IncomeFieldState(
      date: date ?? this.date,
      money: money ?? this.money,
      category: category ?? this.category,
      description: description ?? this.description,
    );
  }
}

class IncomeFieldNotifier extends StateNotifier<IncomeFieldState> {
  IncomeFieldNotifier() : super(IncomeFieldState());

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

final incomeFieldProvider =
    StateNotifierProvider<IncomeFieldNotifier, IncomeFieldState>(
  (ref) => IncomeFieldNotifier(),
);
