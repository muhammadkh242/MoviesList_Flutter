import 'dart:async';
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';


class DBHelper{
 static const _DATA_BASE_NAME = "movies.db";
  static const _DATA_BASE_VERSION = 1;
  static const _TABLE = 'movies';
  static const COLUMN_ID = 'id';
  static const COLUMN_TITLE = 'title';
  static const COLUMN_POSTER = 'poster_path';
  static const COLUMN_OVERVIEW = 'overview';

  // make this a singleton class
  DBHelper._();
  static final DBHelper instance = DBHelper._();

  // only have a single app-wide reference to the database
  static Database? _database;
  Future<Database> get database async {
    if (_database != null) return _database!;
    // lazily instantiate the db the first time it is accessed
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async{
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, _DATA_BASE_NAME);
    return await openDatabase(path,
        version: _DATA_BASE_VERSION,
        onCreate: _onCreate);
  }

  // SQL code to create the database table
  Future _onCreate(Database db, int version) async {
    await db.execute('''
          CREATE TABLE $_TABLE (
            $COLUMN_TITLE TEXT PRIMARY KEY,
            $COLUMN_POSTER TEXT,
            $COLUMN_OVERVIEW TEXT
          )
          ''');
  }
//            $COLUMN_ID TEXT,
  // Helper methods

  Future<int> insert(Map<String, dynamic> row) async {
    Database db = await instance.database;
    print("______________________");

    print(row);
    return await db.insert(_TABLE, row);
  }

  Future<List<Map<String, dynamic>>> queryAllRows() async {
    Database db = await instance.database;
    print("______________________");

    return await db.query(_TABLE);
  }
}

