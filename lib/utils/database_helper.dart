import 'dart:math';
import 'package:flutter/foundation.dart';
import 'package:sqflite/sqflite.dart' as sql;
import 'dart:async';

class SQLHelper {
  static Future<void> createTables(sql.Database database) async {
    await database.execute('CREATE TABLE sorular(id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,baslik TEXT,sorunuz TEXT,createdAt TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP)',);
  }


  static Future<sql.Database> db() async {
    return sql.openDatabase(
      'sorular',
      version: 1,
      onCreate: (sql.Database database, int version) async {
        await createTables(database);
      },
    );
  }

 
  static Future<int> createItem(String baslik, String? sorunuz) async {
    final db = await SQLHelper.db();
    createTables(db);
    final data = {'baslik': baslik, 'sorunuz': sorunuz};
    final id = await db.insert('sorular', data,
        conflictAlgorithm: sql.ConflictAlgorithm.replace);
    return id;
  }

  
  static Future<List<Map<String, dynamic>>> getItems() async {
    final db = await SQLHelper.db();
    return db.query('sorular', orderBy: "id");
  }

 
  static Future<List<Map<String, dynamic>>> getItem(int id) async {
    final db = await SQLHelper.db();
    return db.query('sorular', where: "id = ?", whereArgs: [id], limit: 1);
  }

  
  static Future<int> updateItem(
      int id, String baslik, String? sorunuz) async {
    final db = await SQLHelper.db();

    final data = {
      'baslik': baslik,
      'sorunuz': sorunuz,
      'createdAt': DateTime.now().toString()
    };

    final result =
        await db.update('sorular', data, where: "id = ?", whereArgs: [id]);
    return result;
  }

 
  static Future<void> deleteItem(int id) async {
    final db = await SQLHelper.db();
    try {
      await db.delete("sorular", where: "id = ?", whereArgs: [id]);
    } catch (err) {
      debugPrint("Something went wrong when deleting an item: $err");
    }
  }
}