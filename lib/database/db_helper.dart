import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHelper{
  static const _databaseName = "details.db";
  static const _databaseVersion = 1;

  static const table = "contest_details";

  static const columnID = 'id';
  static const columnTitle = 'column_title';
  static const columnDate = 'column_date';
  static const columnTime = 'column_time';

  static Database? _database ;

  DatabaseHelper._privateConstructor();
  static final DatabaseHelper instance = DatabaseHelper._privateConstructor();
  Future<Database?> get database async {
    if(_database != null)
      {
        return _database;
      }
    _database = await _initDatabase();
    return _database;
  }
  _initDatabase() async{
    Directory documentDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentDirectory.path,_databaseName);
    return await openDatabase(path,version: _databaseVersion,onCreate: _onCreate);
  }

  Future _onCreate(Database db,int version) async{
    await db.execute(
      '''
      CREATE TABLE $table($columnID INTEGER PRIMARY KEY,
      $columnTitle TEXT NOT NULL,
      $columnDate TEXT NOT NULL,
      $columnTime TEXT NOT NULL
      )
      '''
    );
  }

  //insert function
  Future<int?> insert(Map<String,dynamic> row)async{

    Database? db = await instance.database;
    return await db?.insert(table, row);
  }
  // query all data
  Future<List<Map<String,dynamic>>?> queryAll() async{
    Database? db = await instance.database;
    return await db?.query(table);
  }
  //query Specific data
  Future<List<Map<String,dynamic>>?> querySpecific(int id)async
  {
    Database? db = await instance.database;
    var res = await db?.query(table,where: 'id = ?', whereArgs: [2]);
    return res;
  }
  //delete Specific data
  Future<int?> deletedata(int id) async{
    Database? db = await instance.database;
    var res = await db?.delete(table,where: "id = ?",whereArgs: [id]);
    return res;
  }
  //update data
  Future<int?> update(int id) async{
    Database? db = await instance.database;
    var res = await db?.update(table, {"column_title":"vishwakarma"},where: "id = ?",whereArgs: [id]);
    return res;
  }
  // get count of data
  Future<int?> getcount(String title) async{
    Database? db = await instance.database;
    int? count = (await db?.rawQuery("SELECT COUNT(*) FROM $table WHERE $columnTitle=$title")) as int?;
    return count;
  }
}