import 'package:get/get.dart';

import '../../core/models/todo.dart';
import 'package:flutter/material.dart';

class TodoDetailsController extends GetxController{
  Rxn<Todo> todo = Rxn<Todo>();
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController deadlineController = TextEditingController();
  TextEditingController startDateController = TextEditingController();
  TextEditingController finishDateController = TextEditingController();

  @override
  void onInit() {
    super.onInit();
    todo.value = Get.arguments[0];
    titleController.text = todo.value!.title;
    descriptionController.text = todo.value!.description;
    deadlineController.text = todo.value!.deadline;
    startDateController.text = (todo.value!.beginDate ?? "Tâche non commencée")!;
    finishDateController.text = (todo.value!.finishDate ?? "Tâche non terminée")!;
  }
}