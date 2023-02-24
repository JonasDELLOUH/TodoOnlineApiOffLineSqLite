import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_cours/presentation/infos/infos_controller.dart';

class InfoScreen extends StatelessWidget {
  InfoScreen({Key? key}) : super(key: key);
  InfoController controller = Get.put(InfoController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("À propos"),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 30,
              ),
              const Align(
                child: Text(
                  "Nom des membre du groupe",
                  style: TextStyle(
                    fontFamily: 'Montserrat',
                    fontSize: 25,
                    color: Color(0xff000000),
                    fontWeight: FontWeight.w700,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Column(
                children: const [
                  Align(
                    child: Text(
                      "1- DELLOUH Jonas \n 2- LIDEHOU T. Geneviève \n 3- VITODEGNI Isaac \n 4- YEMADJE Waldo Coras \n 5- BODEHOU Alfred \n 6- de SOUZA Giovani \n 7- YEHOUESSI Marcos \n 8- DOKPO G. Isac",
                      style: TextStyle(
                        fontFamily: 'Montserrat',
                        fontSize: 20,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Align(
                    // alignment: AlignmentGeometry(-0.077, 0.664),
                    child: Text(
                      "DESCRIPTION",
                      style: TextStyle(
                        fontFamily: 'Montserrat',
                        fontSize: 25,
                        color: Color(0xff000000),
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(20),
                    child: Align(
                      child: Text(
                        "L'application Todo app est une application qui gère la liste de tâches quotidiennes. Elle permet de suivre nos tâches, de les organiser et de les marquer comme terminées lorsqu'on les a accomplies.\n L'interface utilisateur est simple et intuitive, ce qui facilite l'utilisation de l'application. Vous pouvez ajouter une description brève pour chaque tâche.",
                        style: TextStyle(
                          fontFamily: 'Montserrat',
                          fontSize: 20,
                          color: Color(0xff000000),
                          fontStyle: FontStyle.italic
                        ),
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ));
  }
}
