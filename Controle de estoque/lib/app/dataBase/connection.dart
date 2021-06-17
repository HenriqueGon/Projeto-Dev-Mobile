import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:teste/app/dataBase/scripts/scriptsProduct.dart';

class Connection {
  static Database? _db;

  static Future<Database?> get() async {
    if (_db == null) {
      var path = join(await getDatabasesPath(), 'controle_estoque');

      _db = await openDatabase(
        path,
        version: 1,
        onCreate: (db, v) {
          db.execute(createTableProduct);
          db.execute(insertProduct);
          db.execute(insertProduct1);
        },
      );
    }

    return _db;
  }
}