import 'package:money_manager/enums/expense_enum.dart';
import 'package:money_manager/enums/income_enum.dart';
import 'package:uuid/uuid.dart';

const uuid = Uuid();

class IncomeModel {
  String id;
  IncomeTypes? category;
  String date;
  String description;
  String money;

  factory IncomeModel.fromMap(Map<String, dynamic> map) {
    return IncomeModel(
      id: map['id'] as String,
      category: map['category'] != null
          ? IncomeTypes.values.firstWhere((e) => e.name == map['category'])
          : null,
      date: map['date'] as String,
      description: map['description'] as String,
      money: map['money'] as String,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'category': category?.name,
      'date': date,
      'description': description,
      'money': money,
    };
  }

  IncomeModel({
    this.date = '',
    this.money = '',
    this.category,
    this.description = '',
    String? id,
  }) : id = id ?? uuid.v4();

  IncomeModel copyWith({
    String? date,
    String? money,
    IncomeTypes? category,
    String? description,
  }) {
    return IncomeModel(
      date: date ?? this.date,
      money: money ?? this.money,
      category: category ?? this.category,
      description: description ?? this.description,
    );
  }
}
