import 'package:uuid/uuid.dart';

const uuid = Uuid();

class Money {
  String id;
  String title;
  String category;
  String time;
  String money;

  Money(String? id, this.title, this.category, this.time, this.money)
      : id = id ?? uuid.v4();
}
