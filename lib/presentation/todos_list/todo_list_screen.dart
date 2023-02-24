import 'package:banner_listtile/banner_listtile.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_cours/presentation/home/home_controller.dart';
import 'package:todo_cours/presentation/todos_list/todo_list_controller.dart';
import 'package:todo_cours/routes/app_routes.dart';

import '../../core/models/todo.dart';


class TodoListScreen extends StatelessWidget {
   TodoListScreen({Key? key}) : super(key: key);
   HomeController controller = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Liste des tâches"),
        centerTitle: true,
      ),
      body: Container(
        // padding: EdgeInsets.all(20),
        child: Obx(()
          => controller.todos.isEmpty ? const Center(child: Text("Aucune tâche pour le moment"),) : ListView.builder(
            itemCount: controller.todos.length,
              itemBuilder: (context, int index){
              return todoTile(todo: controller.todos[index]);
              }
          ),
        ),
      ),
    );
  }

  Widget todoTile({required Todo todo}) {
    bool isInProgress =
        (todo.finishDate == null && todo.beginDate != null) ? true : false;
    bool isNotStart = todo.beginDate == null ? true : false;
    bool isStart = !isNotStart;
    return Container(
      padding: EdgeInsets.all(20),
      child: InkWell(
        onTap: (){
          Get.toNamed(AppRoutes.todoDetailsRoute, arguments: [todo]);
        },
        child: Column(
          children: [
            BannerListTile(
              showBanner: false,
              backgroundColor: Colors.blue,
              borderRadius: BorderRadius.circular(8),
              imageContainer: Icon(Icons.work_outline),
              title: Text(
                todo.title.length > 50 ?
                '${todo.title.substring(0, 50)}...' : todo.title,
                style: const TextStyle(fontSize: 20, color: Colors.white),
                overflow: TextOverflow.ellipsis,
                maxLines: 50,
                // maxLines: 1,
              ),
              subtitle: Text(
                todo.description.length > 50 ?
                '${todo.description.substring(0, 50)}...' : todo.description,
                style: const TextStyle(fontSize: 13, color: Colors.white),
                overflow: TextOverflow.ellipsis,
                maxLines: 50,
              ),
            ),
            Container(
              height: 40,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  TextButton(
                      onPressed: (){
                    if(todo.isNotStart() || todo.isInProgress()){
                      Get.toNamed(AppRoutes.updateRoute, arguments: [todo]);
                    }
                  }, child: Text("Modifier",),
                    style: ButtonStyle(foregroundColor: MaterialStatePropertyAll<Color>((todo.isNotStart() || todo.isInProgress()) ? Colors.blue : Colors.red)),
                  ),
                  TextButton(onPressed: (){
                    if(todo.isNotStart()){
                      controller.beginTodo(id: todo.id);
                    }
                  }, child: Text("Commencer"),
                    style: ButtonStyle(foregroundColor: MaterialStatePropertyAll<Color>(todo.isNotStart() ? Colors.blue : Colors.red)),
                  ),
                  TextButton(onPressed: (){
                    if(!todo.isFinish() && todo.isStart()){
                      controller.finishTodo(id: todo.id);
                    }
                  }, child: Text("Finir"),
                    style: ButtonStyle(foregroundColor: MaterialStatePropertyAll<Color>(!todo.isFinish() && todo.isStart() ? Colors.blue : Colors.red)),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
