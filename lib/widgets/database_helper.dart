import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'dart:async';
import 'dart:io';
import 'package:financier/pages/HomePages/EntryModel/entry.dart';

class DatabaseHelper {
  static final _dbName = 'financier.db';
  static final _dbVersion = 1;

  DatabaseHelper._privateConstructor();

  static final DatabaseHelper instance = DatabaseHelper._privateConstructor();

  static final tableIncome = 'income';
  static final tableExpense = 'expense';
  static final tableDebit = 'debit';
  static final tableCredit = 'credit';
  static final tableSummary = 'summary';

  // static final columnId = 'id';
  // static final columnName = 'Name';
  // static final columnNumber = 'Number';

  static Database _database;

  Future<Database> get database async {
    if (_database != null) return _database;

    _database = await _initdatabase();
    return _database;
  }

  Future<Database> _initdatabase() async {
    Directory directory = await getApplicationSupportDirectory();
    String dbPath = join(directory.path, _dbName);
    var database =
        openDatabase(dbPath, version: _dbVersion, onCreate: _onCreate);

    return database;
  }

  void _onCreate(Database db, int version) {
    db.execute('''
      CREATE TABLE $tableIncome(
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        date TEXT NOT NULL,
        perticular TEXT NOT NULL,
        amount FLOAT NOT NULL,
        furtherDescription TEXT NOT NULL
      )
    ''');
    db.execute('''
      CREATE TABLE $tableExpense(
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        date TEXT NOT NULL,
        perticular TEXT NOT NULL,
        amount FLOAT NOT NULL,
        furtherDescription TEXT NOT NULL
      )
    ''');
    db.execute('''
      CREATE TABLE $tableDebit(
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        date TEXT NOT NULL,
        perticular TEXT NOT NULL,
        amount FLOAT NOT NULL,
        furtherDescription TEXT NOT NULL
      )
    ''');
    db.execute('''
      CREATE TABLE $tableCredit(
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        date TEXT NOT NULL,
        perticular TEXT NOT NULL,
        amount FLOAT NOT NULL,
        furtherDescription TEXT NOT NULL
      )
    ''');
    // db.execute('''
    //   CREATE TABLE $tableSummary(
    //     id INTEGER PRIMARY KEY
    //     totalIncome INTEGER,
    //     totalExpense INTEGER,
    //     totalDebit INTEGER,
    //     totalCredit INTEGER,
    //   )
    // ''');
    print('Databse was created');
  }

  Future<int> insert(Entry entry, tableName) async {
    Database db = await instance.database;
    return await db.insert(tableName, entry.toMapforDb());
  }

  Future<List<Entry>> queryAll(tableName) async {
    Database db = await instance.database;

    var res = await db.query(tableName);

    if (res.isNotEmpty) {
      var entry = res.map((carMap) => Entry.fromDb(carMap)).toList();
      return entry;
    }
    return [];
  }

  Future closeDb() async {
    Database db = await instance.database;
    db.close();
  }
}
