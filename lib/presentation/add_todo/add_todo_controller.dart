import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';
import 'package:todo_cours/core/services/sqflite_base.dart';
import 'package:todo_cours/presentation/home/home_controller.dart';
import 'package:todo_cours/presentation/main_page/main_page_controller.dart';
import 'package:todo_cours/presentation/todo_list_sql/todo_list_sql_controller.dart';

import '../../core/constants.dart';
import '../../core/functions.dart';
import '../../core/models/todo.dart';
import '../../core/services/base.dart';
enum SingingCharacter { Hight, Medium }
class AddTodoController extends GetxController{
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController dateTimeController = TextEditingController();
  RxBool isLoading = false.obs;
  RxString priority = "".obs;
  RxString deadline = "".obs;
  final RoundedLoadingButtonController btnController =
  RoundedLoadingButtonController();
  final todoListSqlController = Get.find<TodoListSqlController>();
  final homeController = Get.find<HomeController>();
  final mainController = Get.find<MainPageController>();

  @override
  void onInit() {
    super.onInit();
    Get.put(TodoListSqlController());
  }

  addTodo() async {
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
      "deadline_at": dateTimeController.text
    };
    var response = await api.postFromApi(todoUrl, map, haveToken: true);
    btnController.stop();
    if (response["result"] != null) {
      if(response["result"].containsKey("errors")){
        appSnackBar("error", "Tâche non ajoutée", response["result"]["errors"][0]);
      } else{
        appSnackBar("success", "Tâche ajoutée", "");
        SqfliteBase.addTodo(todo: Todo.fromMap(response["result"]));
        todoListSqlController.getAllTodos();
        homeController.getAllTodo();
        titleController.clear();
        descriptionController.clear();
        dateTimeController.clear();
        priority.value = "";
        mainController.selectedWidgetIndex.value = 1;
      }
    } else {
      appSnackBar("error", "Tâche non ajoutée", response["error"]);
    }
  }


}