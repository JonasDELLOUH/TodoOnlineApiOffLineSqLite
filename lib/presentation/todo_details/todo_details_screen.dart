import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_cours/presentation/todo_details/todo_details_controller.dart';

class TodoDetailsScreen extends GetWidget<TodoDetailsController> {
  const TodoDetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Détails de la tâche"),
        centerTitle: true,
      ),
      body:  SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextField(
                controller: controller.titleController,
                maxLines: null,
                textAlign: TextAlign.center,
                style: const TextStyle(color: Colors.black, fontSize: 25, fontWeight: FontWeight.bold),
                decoration: const InputDecoration(
                  labelStyle: TextStyle(color: Colors.blue, fontSize: 25),
                  labelText: "Titre",
                  enabled: false,
                  border: OutlineInputBorder()
                ),
              ),
              const SizedBox(height: 20,),
              TextField(
                style: const TextStyle(color: Colors.black, fontSize: 25, fontWeight: FontWeight.normal, fontStyle: FontStyle.italic),
                controller: controller.descriptionController,
                keyboardType: TextInputType.multiline,
                maxLines: null,
                textAlign: TextAlign.center,
                decoration: const InputDecoration(
                  labelStyle: TextStyle(color: Colors.blue, fontSize: 25, fontWeight: FontWeight.bold),
                  labelText: "Description",
                    enabled: false,
                    border: OutlineInputBorder()
                ),
              ),
              SizedBox(height: 20,),
              TextField(
                style: const TextStyle(color: Colors.black, fontSize: 25, fontWeight: FontWeight.normal, fontStyle: FontStyle.italic),
                controller: controller.deadlineController,
                keyboardType: TextInputType.multiline,
                maxLines: null,
                textAlign: TextAlign.center,
                decoration: InputDecoration(
                    labelStyle: TextStyle(color: Colors.blue, fontSize: 25, fontWeight: FontWeight.bold),
                    labelText: "Délai",
                    enabled: false,
                    border: const OutlineInputBorder()
                ),
              ),
              SizedBox(height: 20,),
              TextField(
                style: const TextStyle(color: Colors.black, fontSize: 25, fontWeight: FontWeight.normal, fontStyle: FontStyle.italic),
                controller: controller.startDateController,
                keyboardType: TextInputType.multiline,
                maxLines: null,
                textAlign: TextAlign.center,
                decoration: InputDecoration(
                    labelStyle: TextStyle(color: Colors.blue, fontSize: 25, fontWeight: FontWeight.bold),
                    labelText: "Date de Début",
                    enabled: false,
                    border: const OutlineInputBorder()
                ),
              ),
              SizedBox(height: 20,),
              TextField(
                style: const TextStyle(color: Colors.black, fontSize: 25, fontWeight: FontWeight.normal, fontStyle: FontStyle.italic),
                controller: controller.finishDateController,
                keyboardType: TextInputType.multiline,
                maxLines: null,
                textAlign: TextAlign.center,
                decoration: InputDecoration(
                    labelStyle: TextStyle(color: Colors.blue, fontSize: 25, fontWeight: FontWeight.bold),
                    labelText: "Date de Fin",
                    enabled: false,
                    border: const OutlineInputBorder()
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
