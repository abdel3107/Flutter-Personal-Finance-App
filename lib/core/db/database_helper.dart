import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHelper {
  // Singleton instance of DatabaseHelper
  static final DatabaseHelper _instance = DatabaseHelper._internal();
  static Database? _database;

  // Private constructor
  DatabaseHelper._internal();

  // Factory constructor to return the same instance every time
  factory DatabaseHelper() => _instance;

  // Getter for the database instance
  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDB('ongere.db');
    return _database!;
  }

  // Method to initialize the database
  Future<Database> _initDB(String filePath) async {
    String dbPath = await getDatabasesPath();
    return await openDatabase(
      join(dbPath, filePath),
      version: 1,
      onCreate: _createDB,
    );
  }

  // Method to create tables in the database
  Future<void> _createDB(Database db, int version) async {
    await db.execute('''
      CREATE TABLE users (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        username TEXT,
        email TEXT,
        password TEXT
      )
    ''');
  }
}
