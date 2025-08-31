import 'package:money_manager/enums/expense_enum.dart';
import 'package:uuid/uuid.dart';

const uuid = Uuid();

class ExpenseModel {
  String id;
  ExpenseTypes? category;
  String date;
  String description;
  String money;

  factory ExpenseModel.fromMap(Map<String, dynamic> map) {
    return ExpenseModel(
      id: map['id'] as String,
      category: map['category'] != null
          ? ExpenseTypes.values.firstWhere((e) => e.name == map['category'])
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

  ExpenseModel({
    this.date = '',
    this.money = '',
    this.category,
    this.description = '',
    String? id,
  }) : id = id ?? uuid.v4();

  ExpenseModel copyWith({
    String? date,
    String? money,
    ExpenseTypes? category,
    String? description,
  }) {
    return ExpenseModel(
      date: date ?? this.date,
      money: money ?? this.money,
      category: category ?? this.category,
      description: description ?? this.description,
    );
  }
}
