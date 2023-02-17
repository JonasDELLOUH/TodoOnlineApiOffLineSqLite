import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../core/constants.dart';
import '../../core/functions.dart';
import '../../core/services/base.dart';
import '../../routes/app_routes.dart';

class SignUpController extends GetxController{

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  RxBool passwordVisible = false.obs;
  RxBool isLoading = false.obs;

  changePasswordVisible(){
    passwordVisible.value = !passwordVisible.value;
  }

  signUp() async {
    final api = BaseService();
    Map<String, dynamic> map = {
      "email": emailController.text,
      "username": nameController.text,
      "password": passwordController.text,
    };
    isLoading.value = true;
    var response = await api.postFromApi(registerUrl, map);
    isLoading.value = false;
    if (response["result"] != null) {
      if(response["result"].containsKey("errors")){
        appSnackBar("error", "Inscription échouée", response["result"]["errors"][0]);
      } else{
        appSnackBar("success", "Inscription réussie", "Vous êtes enrégistré");
        Get.toNamed(AppRoutes.signInRoute);
      }
    } else {
      appSnackBar("error", "Inscription échouée", response["error"]);
    }
    isLoading.value = false;
  }
}