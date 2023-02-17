import 'package:sqflite/sqflite.dart' as sql;
import 'package:todo_cours/core/constants.dart';

import '../models/todo.dart';

class SqfliteBase {
  static Future<void> createTables(sql.Database database) async {
    await database.execute(
        """ CREATE TABLE IF NOT EXISTS todo
         ($todoId TEXT, 
         $todoTitle TEXT, $todoDescription TEXT, $todoBeginDate TEXT,
          $todoPriority TEXT, $todoUserId Text, $todoDeadline TEXT, 
          $todoFinishedDate TEXT); """);
  }

  static Future<sql.Database> db() async {
    return sql.openDatabase(
      'todo.db',
      version: 1,
      onCreate: (sql.Database database, int version) async {
        await createTables(database);
      },
    );
  }

  static Future<int> addTodo({required Todo todo}) async {
    final bd = await db();
    final data = {
      todoId: todo.id,
      todoTitle: todo.title,
      todoDescription: todo.description,
      todoPriority: todo.priority,
      todoDeadline: todo.deadline,
      todoBeginDate: todo.beginDate,
      todoFinishedDate: todo.finishDate,
      todoUserId: todo.userId.toString()
    };
    final id = await bd.insert('todo', data,
        conflictAlgorithm: sql.ConflictAlgorithm.replace);
    print("adding todo.......");
    return id;
  }

  static Future<int> updateNote(
      {required Todo todo}) async {
    final db = await SqfliteBase.db();
    final data = {
      todoId: todo.id,
      todoTitle: todo.title,
      todoDescription: todo.description,
      todoPriority: todo.priority,
      todoDeadline: todo.deadline,
      todoBeginDate: todo.beginDate,
      todoFinishedDate: todo.finishDate,
      todoUserId: todo.userId
    };
    final result =
    await db.update('todo', data, where: "$todoId = ?", whereArgs: [todo.id]);
    print("updating............");
    return result;
  }
  static Future<List<Todo>> selectAllTodoOffLine() async {
    List<Todo> todos = [];
    final db = await SqfliteBase.db();
    final List<Map<String, Object?>> queryResult = await db.query('todo');
    print("select all offline todos");
    todos = Todo.toList(queryResult);
    return todos;
  }
}
