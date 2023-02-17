import 'package:get/get.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';
import 'package:flutter/material.dart';
import 'package:todo_cours/core/services/sqflite_base.dart';

import '../../core/constants.dart';
import '../../core/functions.dart';
import '../../core/models/todo.dart';
import '../../core/services/base.dart';
import '../../routes/app_routes.dart';
import '../home/home_controller.dart';
import '../todo_list_sql/todo_list_sql_controller.dart';
class  UpdateTodoController extends GetxController{
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController deadlineController = TextEditingController();
  RxBool isLoading = false.obs;
  RxString priority = "".obs;
  RxString deadline = "".obs;
  Rxn<Todo> todo = Rxn<Todo>();
  final RoundedLoadingButtonController btnController =
  RoundedLoadingButtonController();
  final todoListSqlController = Get.find<TodoListSqlController>();
  final homeController = Get.find<HomeController>();

  @override
  void onInit() {
    super.onInit();
    todo.value = Get.arguments[0];
    titleController.text = todo.value!.title;
    descriptionController.text = todo.value!.description;
    priority.value = todo.value!.priority;
    deadlineController.text = todo.value!.deadline;
  }

  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
  }

  updateTodo({required String id}) async {
    final api = BaseService();
    if(priority.value.isEmpty){
      appSnackBar("error", "Vous devez choisir une priorité", "");
      btnController.stop();
      return ;
    }

    Map<String, dynamic> map = {
      "title": titleController.text,
      "description": descriptionController.text,
      "priority": priority.value,
      "deadline_at": deadlineController.text
    };
    var response = await api.patchFromApi(url: todoUrl, map: map, haveToken: true, id: id);
    btnController.stop();
    if (response["result"] != null) {
      if(response["result"].containsKey("errors")){
        appSnackBar("error", "Tâche non modifiée", response["result"]["errors"][0]);
      } else{
        appSnackBar("success", "Tâche modifiée", "");
        SqfliteBase.updateNote(todo: Todo.fromMap(response["result"]));
        todoListSqlController.getAllTodos();
        homeController.getAllTodo();
        Get.back();
      }
    } else {
      appSnackBar("error", "Tâche non modifiée", response["error"]);
    }
  }
}