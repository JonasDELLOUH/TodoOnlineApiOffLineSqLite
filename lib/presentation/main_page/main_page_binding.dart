import 'package:get/get.dart';
import 'package:todo_cours/presentation/add_todo/add_todo_controller.dart';
import 'package:todo_cours/presentation/home/home_controller.dart';
import 'package:todo_cours/presentation/infos/infos_controller.dart';
import 'package:todo_cours/presentation/main_page/main_page_controller.dart';
import 'package:todo_cours/presentation/todo_list_sql/todo_list_sql_controller.dart';
import 'package:todo_cours/presentation/todos_list/todo_list_controller.dart';

class MainPageBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => MainPageController());
    Get.lazyPut(() => TodoListSqlController());
    Get.lazyPut(() => HomeController());
    Get.lazyPut(() => TodoListController());
    Get.lazyPut(() => InfoController());
    Get.lazyPut(() => AddTodoController());
  }
}