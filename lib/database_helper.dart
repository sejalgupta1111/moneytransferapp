import 'dart:async';
import 'dart:io';
import 'package:mollet/user.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';


class DatabaseHelper {
  static final DatabaseHelper _instance = DatabaseHelper.internal();
  factory DatabaseHelper() => _instance;

  static Database? _db;

  Future<Database?> get db async {
    if (_db != null) return _db;
    _db = await initDb();
    return _db;
  }

  DatabaseHelper.internal();

  Future<Database> initDb() async {
    String databasesPath = await getDatabasesPath();
    String path = join(databasesPath, 'mollet');

    // Open/create the database at a given path
    var db = await openDatabase(path, version: 1, onCreate: _onCreate);
    return db;
  }


  void _onCreate(Database db, int version) async {
    // Create your tables here
    await db.execute('CREATE TABLE users (id INTEGER PRIMARY KEY, phone TEXT, password TEXT, amount TEXT)');
  }


  // Add your methods for inserting, retrieving, and updating data
  // For example, let's create a method to insert a user into the database
  Future<int> insertUser(User user) async {
    var dbClient = await db;
    return await dbClient!.insert('users', user.toMap());
  }

  Future<List<Map<String, Object?>>> checkUser(User user) async{
     var dbClient = await db;
     return  await dbClient!.rawQuery("select * from users where phone='"+user.phone.toString()+"' and password='"+user.password.toString()+"'",null);


  }
  // Future<List<User>> checkUser(User user) async{
  //   final db= awaot
  //
  // }

  // Future<int> deleteUser(User user) async{
  //   var dbClient=await db;
  //   return await dbClient!.rawDelete("delete from users where phone='"+user.phone.toString()+"' and paFuture<List<Map<String, Object?>>>ser.password.toString()+"'",null);
  //
  // }

  Future<List<Map<String, Object?>>> addColumn() async{
    var dbClient= await db;
    return await dbClient!.rawQuery('ALTER TABLE users add column amount TEXT');
  }



// Add additional methods as needed


}
