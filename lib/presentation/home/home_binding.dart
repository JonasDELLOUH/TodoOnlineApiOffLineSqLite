import 'package:get/get.dart';
import 'package:todo_cours/presentation/home/home_controller.dart';

import '../add_todo/add_todo_controller.dart';
class HomeBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => HomeController());
  }
}