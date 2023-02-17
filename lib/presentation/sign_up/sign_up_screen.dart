import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_cours/presentation/sign_up/sign_up_controller.dart';
import 'package:todo_cours/routes/app_routes.dart';

class SignUpScreen extends GetWidget<SignUpController> {
  SignUpScreen({Key? key}) : super(key: key);
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            const Text(
              "Inscription",
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
                      controller: controller.nameController,
                      keyboardType: TextInputType.text,
                      decoration: const InputDecoration(
                          hintText: "Entrez votre pseudo",
                          labelText: "Pseudo",
                          icon: Icon(Icons.person)),
                      validator: (value) {
                        return value == null || value == ""
                            ? "Ce champs est obligatoire"
                            : null;
                      },
                    ),
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
                          icon: const Icon(Icons.lock),
                          suffixIcon: IconButton(
                            onPressed: () {
                              controller.changePasswordVisible();
                            },
                            icon:
                               controller.passwordVisible.value
                                  ? const Icon(Icons.visibility_off)
                                  : const Icon(Icons.visibility),

                          ),
                        ),
                        validator: (value) {
                          return value == null || value == ""
                              ? "Ce champs est obligatoire"
                              : null;
                        },
                      ),
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    Obx(()
                      => controller.isLoading.value == true
                          ? const SizedBox(
                          height: 20,
                          width: 20,
                          child: CircularProgressIndicator(
                            // color: Colors.white,
                            strokeWidth: 5,
                          ))
                          : ElevatedButton(
                          onPressed: () async {
                            if (!controller.isLoading.value &&
                                formKey.currentState!.validate()) {
                              controller.signUp();
                            }

                          },
                          child: const Text("S'inscrire")),
                    )
                  ],
                )),
            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                onPressed: () {
                  // Navigator.push(context,
                  //     MaterialPageRoute(builder: (context) => LoginScreen()));
                  Get.toNamed(AppRoutes.signInRoute);
                },
                child: const Text(
                  "Vous avez un compte? Connectez vous",
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
