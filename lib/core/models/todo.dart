import 'package:intl/intl.dart';
import 'package:todo_cours/core/constants.dart';

class Todo {
  String id;
  String title;
  String description;
  String priority;
  String? createdDate;
  String? updatedDate;
  String deadline;
  String? beginDate;
  String? finishDate;
  String userId;

  Todo(
      {required this.id, required this.title, required this.priority, required this.deadline, required this.updatedDate, required this.beginDate, required this.createdDate, required this.finishDate, required this.userId, required this.description});

  bool isStart(){
    return beginDate != null;
  }

  bool isNotStart(){
    return beginDate == null;
  }

  bool isInProgress(){
    return finishDate == null && beginDate != null;
  }

  bool isFinish(){
    return finishDate != null;
  }

  bool isFinishLate(){
    if(finishDate != null){
      DateTime todoFinishedDateD = DateFormat("yyyy-MM-dd HH:mm:ss").parse(finishDate!);
      double todoFinishedDated = todoFinishedDateD.millisecondsSinceEpoch.toDouble();
      DateTime todoDeadlineD = DateFormat("yyyy-MM-dd HH:mm:ss").parse(deadline);
      double todoDeadlined = todoDeadlineD.millisecondsSinceEpoch.toDouble();
      if (todoDeadlined < todoFinishedDated) {
        return true;
      }
    }
    return false;
  }

  factory Todo.fromMap(Map<String, dynamic> map){
    return Todo(id: map[todoId],
        title: map[todoTitle],
        description: map[todoDescription],
        priority: map[todoPriority],
        deadline: map[todoDeadline],
        updatedDate: map[todoUpdateDate],
        beginDate: map[todoBeginDate],
        createdDate: map[todoCreatedDate],
        finishDate: map[todoFinishedDate],
        userId: map[todoUserId]);
  }

  static List<Todo> toList(List jsonData){
    List<Todo> todos = [];
    for(dynamic data in jsonData){
      todos.add(Todo.fromMap(data));
    }
    return todos;
  }
}