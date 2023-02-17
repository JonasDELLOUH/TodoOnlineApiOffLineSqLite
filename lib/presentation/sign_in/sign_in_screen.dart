import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_cours/presentation/sign_in/sign_in_controller.dart';

import '../../routes/app_routes.dart';

class SignInScreen extends GetWidget<SignInController> {
   SignInScreen({Key? key}) : super(key: key);
  final formKey = GlobalKey<FormState>();
   bool _passwordVisible = false;

  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(
              "Connexion",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 30,
                  color: Colors.blue),
            ),
            Form(
                key: formKey,
                child: Column(
                  children: [
                    TextFormField(
                      controller: controller.emailController,
                      keyboardType: TextInputType.emailAddress,
                      decoration: const InputDecoration(
                          hintText: "Entrez votre e-mail",
                          labelText: "E-mail",
                          icon: Icon(Icons.alternate_email)),
                      validator: (value) {
                        return value == null || value == ""
                            ? "Ce champs est obligatoire"
                            : null;
                      },
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    Obx(()
                      => TextFormField(
                        controller: controller.passwordController,
                        keyboardType: TextInputType.text,
                        obscureText: controller.passwordVisible.value,
                        decoration: InputDecoration(
                          hintText: "Entrez votre mot de passe",
                          labelText: "Mot de passe",
                          icon: Icon(Icons.lock),
                          suffixIcon: IconButton(
                            onPressed: () {
                              controller.changePasswordVisible();
                            },
                            icon: _passwordVisible
                                ? Icon(Icons.visibility_off)
                                : Icon(Icons.visibility),
                          ),
                        ),
                        validator: (value) {
                          return value == null || value == ""
                              ? "Ce champs est obligatoire"
                              : null;
                        },
                      ),
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    ElevatedButton(
                        onPressed: () async {
                          if (kDebugMode) {
                            print("fjfjfjfdj");
                          }
                          if (!controller.isLoading.value && formKey.currentState!.validate()) {
                            controller.signIn();
                          }
                        },
                        child: Obx(()
                          => controller.isLoading.value
                              ? SizedBox(
                              height: 20,
                              width: 20,
                              child: CircularProgressIndicator(
                                color: Colors.white,
                                strokeWidth: 3,
                              ))
                              : Text("Se connecter"),
                        ))
                  ],
                )),
            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                onPressed: () {
                  // Navigator.push(
                  //     context,
                  //     MaterialPageRoute(
                  //         builder: (context) => RegisterScreen()));
                  Get.toNamed(AppRoutes.signUpRoute);
                },
                child: Text(
                  "Pas de Compte? Créer un compte",
                  style: TextStyle(fontSize: 17, color: Colors.blue),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
