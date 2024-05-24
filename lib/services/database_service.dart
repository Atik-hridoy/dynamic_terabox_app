import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import '../models/input_model.dart';

class DatabaseService {
  static final DatabaseService _instance = DatabaseService._();
  static Database? _database;

  DatabaseService._();

  factory DatabaseService() => _instance;

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDB();
    return _database!;
  }

  Future<Database> _initDB() async {
    String path = join(await getDatabasesPath(), 'input_data.db');
    return openDatabase(
      path,
      onCreate: (db, version) {
        return db.execute(
          "CREATE TABLE inputs(id INTEGER PRIMARY KEY, values TEXT, selections TEXT)",
        );
      },
      version: 1,
    );
  }

  Future<void> insertInput(InputModel input) async {
    final db = await database;
    await db.insert('inputs', input.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  Future<List<InputModel>> retrieveInputs() async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query('inputs');
    return List.generate(maps.length, (i) {
      return InputModel.fromMap(maps[i]);
    });
  }
}
