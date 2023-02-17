import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:todo_cours/core/constants.dart';

import '../../core/functions.dart';
import '../../core/models/todo.dart';
import '../../core/services/base.dart';

class HomeController extends GetxController{
  RxList todos = [].obs;
  RxInt nbrTodos = 0.obs;
  RxInt nbrTodosNotStarted = 0.obs;
  RxInt nbrTodosInProgress = 0.obs;
  RxInt nbrTodosFinished = 0.obs;
  RxInt nbrTodosFinishLate = 0.obs;
  RxBool isLoading = false.obs;
  @override
  Future<void> onInit() async {
    // TODO: implement onInit
    super.onInit();
    await getAllTodo();
  }

  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
  }

  updateNbrTodos(){
    nbrTodos.value = todos.length;
    int n1 = 0;
    int n2 = 0;
    int n3 = 0;
    int n4 = 0;
    for(Todo todo in todos){
      if(todo.isNotStart()){
        n1 ++;
      }
      if (todo.isInProgress()) {
        n2 ++;
      }
      if (todo.isFinish()) {
        n3 ++;
      }
      if(todo.isFinishLate()){
        n4 ++;
      }

    }
    nbrTodosNotStarted.value = n1;
    nbrTodosInProgress.value = n2;
    nbrTodosFinished.value = n3;
    nbrTodosFinishLate.value = n4;
  }

  getAllTodo() async{
    final api = BaseService();
    Map<String, dynamic> parameters = {
    };
    isLoading.value = true;
    var response = await api.getFromApi(todoUrl, parameters: parameters, haveToken: true);
    isLoading.value = false;
    if (response["result"] != null) {
        // appSnackBar("success", "Tâche ajoutée", "");
        // Get.toNamed(AppRoutes.homeRoute);
        todos.value = Todo.toList(response["result"]);
        updateNbrTodos();
    } else {
      appSnackBar("error", "Récupération échouée", response["error"]);
    }
    isLoading.value = false;
  }

  beginTodo({required String id}) async {
    final api = BaseService();
    Map<String, dynamic> map = {
      todoBeginDate: DateTime.now().toString(),
    };
    var response = await api.patchFromApi(url: todoUrl, map: map, haveToken: true, id: id);
    if (response["result"] != null) {
      appSnackBar("success", "Tâche commencée", "");
      // Get.toNamed(AppRoutes.homeRoute);
      getAllTodo();
    } else {
      appSnackBar("error", "Impossible de commencer", response["error"]);
    }
  }

  finishTodo({required String id}) async {
    final api = BaseService();
    Map<String, dynamic> map = {
      todoFinishedDate: DateTime.now().toString(),
    };
    var response = await api.patchFromApi(url: todoUrl, map: map, haveToken: true, id: id);
    if (response["result"] != null) {
      appSnackBar("success", "Tâche terminée", "");
      // Get.toNamed(AppRoutes.homeRoute);
      getAllTodo();
    } else {
      appSnackBar("error", "Impossible de terminer", response["error"]);
    }
  }
}