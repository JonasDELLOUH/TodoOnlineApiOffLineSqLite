import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_cours/presentation/add_todo/add_todo_screen.dart';
import 'package:todo_cours/presentation/home/home_screen.dart';
import 'package:todo_cours/presentation/infos/info_screen.dart';
import 'package:todo_cours/presentation/main_page/main_page_controller.dart';
import 'package:todo_cours/presentation/todo_list_sql/todo_list_sql_screen.dart';
import 'package:todo_cours/presentation/todos_list/todo_list_screen.dart';

import '../../core/widgets/bar_item.dart';

class MainPageScreen extends GetWidget<MainPageController> {
  const MainPageScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          body: Obx(() => getCurrentWidget()),
          bottomNavigationBar: BottomAppBar(
            child: Obx(() =>  Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              mainAxisSize: MainAxisSize.max,
              children: [
                BarItem(
                    iconData: Icons.home,
                    onPressed: () {
                      controller.selectedWidgetIndex.value = 1;
                    },
                    selected: controller.selectedWidgetIndex.value == 1
                ),
                BarItem(
                    iconData: Icons.work,
                    onPressed: () {
                      controller.selectedWidgetIndex.value = 2;
                    },
                    selected: controller.selectedWidgetIndex.value == 2
                ),
                BarItem(
                    iconData: Icons.add_circle,
                    onPressed: () {
                      controller.selectedWidgetIndex.value = 3;
                    },
                    selected: controller.selectedWidgetIndex.value == 3
                ),
                BarItem(
                    iconData: Icons.work_history,
                    onPressed: () {
                      controller.selectedWidgetIndex.value = 4;
                    },
                    selected: controller.selectedWidgetIndex.value == 4
                ),
                BarItem(
                    iconData: Icons.info,
                    onPressed: () {
                      controller.selectedWidgetIndex.value = 5;
                    },
                    selected: controller.selectedWidgetIndex.value == 5
                ),
              ],
            )),
          ),
        ));
  }

  Widget getCurrentWidget(){
    switch(controller.selectedWidgetIndex.value){
      case 1:
        return  HomeScreen();
      case 2:
        return  TodoListScreen();
      case 3:
        return AddTodoScreen();
      case 4:
        return  TodoListSqlScreen();
      case 5:
        return  InfoScreen();
      default:
        return HomeScreen();
    }
  }
}
