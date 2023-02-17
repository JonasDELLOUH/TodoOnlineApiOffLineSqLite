import 'package:get/get.dart';
import 'package:sqflite/sqflite.dart';

import '../../core/services/sqflite_base.dart';

class TodoListSqlController extends GetxController{
  RxList todos = [].obs;

  @override
  Future<void> onInit() async {
    super.onInit();
    await getAllTodos();
  }

  getAllTodos() async {
    todos.value = await SqfliteBase.selectAllTodoOffLine();
  }

}