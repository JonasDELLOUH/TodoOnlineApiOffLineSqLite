import 'package:get/get.dart';
import 'package:todo_cours/presentation/todo_list_sql/todo_list_sql_controller.dart';

import '../home/home_controller.dart';
import 'add_todo_controller.dart';
class AddTodoBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => AddTodoController());
    Get.put(TodoListSqlController());
    Get.lazyPut(() => HomeController());
  }
}