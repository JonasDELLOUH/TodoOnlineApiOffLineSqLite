import 'package:get/get.dart';
import 'package:todo_cours/presentation/home/home_controller.dart';

class TodoListBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => HomeController());
  }

}