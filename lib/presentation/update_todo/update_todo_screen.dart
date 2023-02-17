import 'package:datetime_picker_formfield_new/datetime_picker_formfield_new.dart';
import 'package:drop_down_list/drop_down_list.dart';
import 'package:drop_down_list/model/selected_list_item.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:get/get.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';
import 'package:todo_cours/presentation/update_todo/update_todo_controller.dart';

import '../../core/models/todo.dart';

class UpdateTodoScreen extends StatelessWidget {
  UpdateTodoScreen({Key? key}) : super(key: key);
  UpdateTodoController controller = Get.put(UpdateTodoController());

  final format = DateFormat("yyyy-MM-dd HH:mm:ss");

  final formKey = GlobalKey<FormState>();

  final List<SelectedListItem> _listOfCities = [
    SelectedListItem(
      name: "Élevé",
      value: "high",
      isSelected: false,
    ),
    SelectedListItem(
      name: "Moyen",
      value: "medium",
      isSelected: false,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Modifier la tâche',
          style: TextStyle(
            fontFamily: 'Montserrat',
            fontSize: 27,
            color: Color(0xffffffff),
            fontWeight: FontWeight.w700,
          ),
          textAlign: TextAlign.center,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Form(
            key: formKey,
            child: Column(
              children: [
                const SizedBox(
                  height: 40,
                ),
                TextFormField(
                  keyboardType: TextInputType.name,
                  controller: controller.titleController,
                  decoration: const InputDecoration(
                      icon: Icon(Icons.note_add),
                      hintText: 'Titre de la tâche',
                      labelText: 'Tâches'),
                  validator: (value) {
                    return value == null || value == ""
                        ? "Ce champs est obligatoire"
                        : null;
                  },
                ),
                const SizedBox(
                  height: 30,
                ),
                TextFormField(
                  keyboardType: TextInputType.multiline,
                  maxLines: null,
                  controller: controller.descriptionController,
                  decoration: const InputDecoration(
                      icon: Icon(Icons.description),
                      hintText: 'Ajouter description',
                      labelText: 'Description'),
                  validator: (value) {
                    return value == null || value == ""
                        ? "Ce champs est obligatoire"
                        : null;
                  },
                ),
                const SizedBox(
                  height: 30,
                ),
                Text("Priorité de la tâche"),
                const SizedBox(
                  height: 5,
                ),
                InkWell(
                  onTap: () {
                    DropDownState(
                      DropDown(
                        bottomSheetTitle: const Text(
                          "Priorité de la tâche",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20.0,
                          ),
                        ),
                        submitButtonChild: const Text(
                          'Done',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        data: _listOfCities ?? [],
                        selectedItems: (List<dynamic> selectedList) {
                          List<String> list = [];
                          for (var item in selectedList) {
                            if (item is SelectedListItem) {
                              controller.priority.value = item.value!;
                            }
                          }
                          // showSnackBar(list.toString());
                        },
                        enableMultipleSelection: false,
                      ),
                    ).showModal(context);
                  },
                  child: Container(
                    height: 50,
                    width: width,
                    decoration: BoxDecoration(
                        color: Colors.black.withOpacity(0.3),
                        borderRadius: const BorderRadius.only(
                            bottomLeft: Radius.circular(10),
                            bottomRight: Radius.circular(10),
                            topLeft: Radius.circular(10),
                            topRight: Radius.circular(10))),
                    child: Center(
                        child: Obx(() => Text(controller.priority.value.isEmpty
                            ? "Choisissez une priorité"
                            : controller.priority.value))),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                const Text("Le délai de la tâche"),
                const SizedBox(
                  height: 5,
                ),
                DateTimeField(
                  format: format,
                  controller: controller.deadlineController,
                  decoration: const InputDecoration(
                    labelText: "Deadline",
                    enabledBorder:
                        OutlineInputBorder(borderSide: BorderSide(width: 1)),
                    errorBorder:
                        OutlineInputBorder(borderSide: BorderSide(width: 1)),
                  ),
                  validator: (value) {
                    return value == null || value == ""
                        ? "Ce champs est obligatoire"
                        : null;
                  },
                  onShowPicker: (context, currentValue) async {
                    final date = await showDatePicker(
                        context: context,
                        firstDate: DateTime(1900),
                        initialDate: currentValue ?? DateTime.now(),
                        lastDate: DateTime(2100));
                    if (date != null) {
                      final time = await showTimePicker(
                        context: context,
                        initialTime: TimeOfDay.fromDateTime(
                            currentValue ?? DateTime.now()),
                      );
                      return DateTimeField.combine(date, time);
                    } else {
                      return currentValue;
                    }
                  },
                ),
                const SizedBox(
                  height: 30,
                ),
                RoundedLoadingButton(
                  width: width * 0.8,
                  height: 50,
                  controller: controller.btnController,
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      controller.updateTodo(id: controller.todo.value!.id.toString());
                    } else {
                      controller.btnController.stop();
                    }
                  },
                  // color: ColorConstant.indigo300,
                  borderRadius: 10,
                  child: const Text("Modifier",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                          fontFamily: "Poppins")),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
