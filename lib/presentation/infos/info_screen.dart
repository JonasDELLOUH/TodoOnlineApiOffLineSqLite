import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_cours/presentation/infos/infos_controller.dart';

class InfoScreen extends StatelessWidget {
   InfoScreen({Key? key}) : super(key: key);
  InfoController controller = Get.put(InfoController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Informations"),
        centerTitle: true,
      ),
    );
  }
}
