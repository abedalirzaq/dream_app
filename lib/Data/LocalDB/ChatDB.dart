import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

import '../../Model/MessageModel/MessageModel.dart';

class ChatDatabase {
  static Database? _db;

  // فتح قاعدة البيانات وإنشاؤها إذا لم تكن موجودة
  static Future<Database> get database async {
    if (_db != null) return _db!;
    _db = await initDB();
    return _db!;
  }

  static Future<Database> initDB() async {
    final path = join(await getDatabasesPath(), 'chat.db');
    return await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) async {
        await db.execute('''
          CREATE TABLE messages (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            message TEXT NOT NULL,
            isSystem INTEGER NOT NULL,
            createdAt TEXT
          )
        ''');
      },
    );
  }

  // إضافة رسالة جديدة
  static Future<int> insertMessage(ChatMessageModel msg) async {
    final db = await database;
    return await db.insert('messages', msg.toMap());
  }

  // حذف رسالة حسب ID
  static Future<int> deleteMessageById(int id) async {
    final db = await database;
    return await db.delete('messages', where: 'id = ?', whereArgs: [id]);
  }

  // حذف جميع الرسائل
  static Future<int> deleteAllMessages() async {
    final db = await database;
    return await db.delete('messages');
  }

  // جلب آخر 100 رسالة (مرتبة من الأحدث للأقدم)
  static Future<List<ChatMessageModel>> getLast100Messages() async {
    final db = await database;
    final result = await db.query(
      'messages',
      orderBy: 'createdAt DESC',
      limit: 100,
    );
    return result.map((e) => ChatMessageModel.fromMap(e)).toList();
  }
}
