import 'dart:async';

import 'package:get/get.dart';
import 'package:todo_cours/routes/app_routes.dart';
class Splash2Controller extends GetxController{
  @override
  void onReady() {
    super.onReady();
    Get.offNamed(AppRoutes.mainRoute);
    // Future.delayed(Duration(seconds: 1), (){
    //
    // });
  }
}