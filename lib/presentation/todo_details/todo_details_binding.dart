import 'package:get/get.dart';
import 'package:todo_cours/presentation/todo_details/todo_details_controller.dart';

class TodoDetailsBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => TodoDetailsController());
  }
}