import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:todo_cours/presentation/add_todo/add_todo_binding.dart';
import 'package:todo_cours/presentation/add_todo/add_todo_screen.dart';
import 'package:todo_cours/presentation/home/home_binding.dart';
import 'package:todo_cours/presentation/home/home_screen.dart';
import 'package:todo_cours/presentation/infos/info_binding.dart';
import 'package:todo_cours/presentation/infos/info_screen.dart';
import 'package:todo_cours/presentation/main_page/main_page_binding.dart';
import 'package:todo_cours/presentation/main_page/main_page_screen.dart';
import 'package:todo_cours/presentation/sign_in/sign_in_binding.dart';
import 'package:todo_cours/presentation/sign_in/sign_in_screen.dart';
import 'package:todo_cours/presentation/sign_up/sign_up_screen.dart';
import 'package:todo_cours/presentation/splash2/splash2_binding.dart';
import 'package:todo_cours/presentation/splash2/splash2_screen.dart';
import 'package:todo_cours/presentation/todo_details/todo_details_binding.dart';
import 'package:todo_cours/presentation/todo_details/todo_details_screen.dart';
import 'package:todo_cours/presentation/todo_list_sql/todo_list_sql_binding.dart';
import 'package:todo_cours/presentation/todo_list_sql/todo_list_sql_screen.dart';
import 'package:todo_cours/presentation/todos_list/todo_list_binding.dart';
import 'package:todo_cours/presentation/todos_list/todo_list_screen.dart';
import 'package:todo_cours/presentation/update_todo/update_todo_binding.dart';
import 'package:todo_cours/presentation/update_todo/update_todo_screen.dart';
import '../presentation/sign_up/sign_up_binding.dart';

class AppRoutes {
  static String initialRoute = '/initialRoute';
  static String signInRoute = "/signIn";
  static String signUpRoute = "/signUp";
  static String homeRoute = "/home";
  static String addTodoRoute = "/addTodo";
  static String todoListRoute = "/todoList";
  static String todoListSqlRoute = "/todoListSqlRoute";
  static String infoRoute = "/infoRoute";
  static String todoDetailsRoute = "/todoDetailsRoute";
  static String splash2Route = "/splash2Route";
  static String mainRoute = "/mainRoute";
  static String updateRoute = "/updateRoute";

  static List<GetPage<dynamic>>? pages = [
    GetPage(
      page: () => SignInScreen(),
      bindings: [
        SignInBinding(),
      ],
      name: signInRoute,
    ),
    GetPage(
        page: () => SignUpScreen(),
        bindings: [SignUpBinding()],
        name: signUpRoute),
    GetPage(
        name: splash2Route,
        page: () => Splash2Screen(),
        binding: Splash2Binding()),
    GetPage(
        name: mainRoute,
        page: () => MainPageScreen(),
        bindings: [MainPageBinding()]),
    GetPage(name: homeRoute, binding: HomeBinding(), page: () => HomeScreen()),
    GetPage(
        name: todoListRoute,
        page: () => TodoListScreen(),
        bindings: [TodoListBinding()]),
    GetPage(
        name: addTodoRoute,
        bindings: [AddTodoBinding()],
        page: () => AddTodoScreen()),
    GetPage(
        name: todoListSqlRoute,
        page: () => TodoListSqlScreen(),
        binding: TodoListSqlBinding()),
    GetPage(
        name: infoRoute, page: () => InfoScreen(), bindings: [InfoBinding()]),
    GetPage(
        name: todoDetailsRoute,
        page: () => TodoDetailsScreen(),
        bindings: [TodoDetailsBinding()]),
    GetPage(
        name: updateRoute,
        page: () => UpdateTodoScreen(),
        binding: UpdateTodoBinding())
  ];
}
