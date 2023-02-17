import 'package:banner_listtile/banner_listtile.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_cours/presentation/home/home_controller.dart';

class HomeScreen extends StatelessWidget {
   HomeScreen({Key? key}) : super(key: key);
  HomeController controller = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    // double height = MediaQuery.of(context).size.height;
    // double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text("Statistiques"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child:  Obx(()
          => Column(
              children: [
                staticOption(todoTYpe: 'Toutes les tâches', nbr: controller.nbrTodos.value, everything: ""),
                staticOption(todoTYpe: 'Tâches non commencées', nbr: controller.nbrTodosNotStarted.value),
                staticOption(todoTYpe: 'Tâches en cours', nbr: controller.nbrTodosInProgress.value),
                staticOption(todoTYpe: 'Tâches finies', nbr: controller.nbrTodosFinished.value),
                staticOption(todoTYpe: 'Tâches finies avec retard', nbr: controller.nbrTodosFinishLate.value),
              ],
          ),
        ),
      ),
    );
  }

  Widget staticOption({required String todoTYpe, required int nbr, String everything = ""}) {
    return Container(
      margin: EdgeInsets.all(20),
      child: BannerListTile(
        showBanner: false,
        backgroundColor: Colors.blue,
        borderRadius: BorderRadius.circular(8),
        imageContainer: Icon(Icons.work_outline),
        title:  Text(
          todoTYpe,
          style: const TextStyle(fontSize: 20, color: Colors.white),
          overflow: TextOverflow.fade,
          // maxLines: 1,
        ),
        subtitle:  Text(everything,
            style: const TextStyle(fontSize: 13, color: Colors.white)),
        trailing: Text(nbr.toString(), style: TextStyle(
          color: Colors.white,
          fontSize: 40
        ),),
      ),
    );
  }
}
