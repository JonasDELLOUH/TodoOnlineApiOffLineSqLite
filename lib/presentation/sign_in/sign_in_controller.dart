import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:todo_cours/core/constants.dart';

import '../../core/functions.dart';
import '../../core/services/base.dart';
import '../../routes/app_routes.dart';

class SignInController extends GetxController{
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  RxBool passwordVisible = false.obs;
  RxBool isLoading = false.obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }

  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
  }

  changePasswordVisible(){
    passwordVisible.value = !passwordVisible.value;
  }

  signIn() async {
    final api = BaseService();
    Map<String, dynamic> map = {
      "email": emailController.text,
      "password": passwordController.text,
      "strategy": "local"
    };
    isLoading.value = true;
    var response = await api.postFromApi(authenticationUrl, map);
    isLoading.value = false;
    if (response["result"] != null) {
      if(response["result"].containsKey("errors")){
        appSnackBar("error", "Connexion échouée", response["result"]["errors"][0]);
      } else{
        saveSharedPref("user", response["result"]["user"]);
        saveSharedPref("token", response["result"]["accessToken"]);
        appSnackBar("success", "Connexion réussie", "Vous êtes connecté");
        Get.offNamed(AppRoutes.splash2Route);
      }
    } else {
      appSnackBar("error", "Connexion échouée", response["error"]);
    }
    isLoading.value = false;
  }

}