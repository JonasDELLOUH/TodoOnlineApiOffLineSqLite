import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_cours/presentation/splash2/splash2_controller.dart';

class Splash2Screen extends GetWidget<Splash2Controller> {
  const Splash2Screen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
