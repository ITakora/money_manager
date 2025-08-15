import 'package:money_manager/enums/enum_category.dart';
import 'package:uuid/uuid.dart';

const uuid = Uuid();

class Money {
  String id;
  Category? category;
  String date;
  String description;
  String money;

  Money({
    this.date = '',
    this.money = '',
    this.category,
    this.description = '',
    String? id,
  }) : id = id ?? uuid.v4();

  Money copyWith({
    String? date,
    String? money,
    Category? category,
    String? description,
  }) {
    return Money(
      date: date ?? this.date,
      money: money ?? this.money,
      category: category ?? this.category,
      description: description ?? this.description,
    );
  }
}
