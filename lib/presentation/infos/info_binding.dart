import 'package:get/get.dart';
import 'package:todo_cours/presentation/infos/infos_controller.dart';

class InfoBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => InfoController());
  }

}