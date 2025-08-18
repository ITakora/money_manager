import 'package:path/path.dart' as path;
import 'package:sqflite/sqflite.dart' as sql;
import 'package:sqflite/sqlite_api.dart';

Future<Database> initDb() async {
  final dbPath = await sql.getDatabasesPath();
  final dbFilePath = path.join(dbPath, 'track_money.db');

  return sql.openDatabase(
    dbFilePath,
    version: 1,
    onCreate: (db, version) {
      _createDB(db);
    },
  );
}

Future _createDB(Database db) async {
  await db.execute(
    '''
    CREATE TABLE expense (
      id TEXT PRIMARY KEY,
      category TEXT,
      date TEXT,
      description TEXT,
      money TEXT
    )
  ''',
  );

  await db.execute(
    '''
    CREATE TABLE income (
      id TEXT PRIMARY KEY,
      category TEXT,
      date TEXT,
      description TEXT,
      money TEXT
    )
  ''',
  );
}
