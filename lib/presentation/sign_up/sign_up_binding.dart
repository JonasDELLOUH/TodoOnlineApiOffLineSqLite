import 'package:get/get.dart';
import 'package:todo_cours/presentation/sign_up/sign_up_controller.dart';

class SignUpBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => SignUpController());
  }
}