import 'package:banner_listtile/banner_listtile.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_cours/presentation/todo_list_sql/todo_list_sql_controller.dart';

import '../../core/models/todo.dart';

class TodoListSqlScreen extends StatelessWidget {
  TodoListSqlScreen({Key? key}) : super(key: key);
  TodoListSqlController controller = Get.put(TodoListSqlController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Les tâches offline"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Obx(()
          => controller.todos.isEmpty ? const Center(child: Text("Aucune tâche pour le moment"),) : ListView.builder(
            itemCount: controller.todos.length,
              itemBuilder: (context, int index){
              return todoWidget(todo: controller.todos[index]);
          }),
        ),
      ),
    );
  }

  Widget todoWidget({required Todo todo}) {
    return Container(
      child: BannerListTile(
        showBanner: false,
        backgroundColor: Colors.blue,
        borderRadius: BorderRadius.circular(8),
        imageContainer: Icon(Icons.work_outline),
        title:  Text(
          todo.title,
          style: const TextStyle(fontSize: 20, color: Colors.white),
          overflow: TextOverflow.fade,
          // maxLines: 1,
        ),
        subtitle:  Text(todo.description,
            style: const TextStyle(fontSize: 13, color: Colors.white)),

      ),
    );
  }
}
