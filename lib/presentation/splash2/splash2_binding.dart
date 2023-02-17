import 'package:get/get.dart';
import 'package:todo_cours/presentation/splash2/splash2_controller.dart';

class Splash2Binding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => Splash2Controller());
  }

}