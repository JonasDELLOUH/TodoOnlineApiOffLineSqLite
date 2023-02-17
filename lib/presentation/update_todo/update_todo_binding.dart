import 'package:get/get.dart';
import 'package:todo_cours/presentation/update_todo/update_todo_controller.dart';

class UpdateTodoBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => UpdateTodoController());
  }

}