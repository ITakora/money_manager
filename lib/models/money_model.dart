import 'package:uuid/uuid.dart';

const uuid = Uuid();

class Money {
  String id;
  String title;
  String category;
  String time;
  String money;
  String Deskripsi;

  Money({
    required this.title,
    required this.category,
    required this.time,
    required this.money,
    required this.Deskripsi,
    String? id,
  }) : id = id ?? uuid.v4();
}
