import 'package:get/get.dart';
import 'package:todo_cours/presentation/todo_list_sql/todo_list_sql_controller.dart';

class TodoListSqlBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => TodoListSqlController());
  }
}