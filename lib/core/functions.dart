import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

appSnackBar(String type, title, message) {
  switch (type) {
    case "success":
      Get.snackbar(title, message,
          snackPosition: SnackPosition.TOP,
          colorText: Colors.white,
          backgroundColor: Colors.green);
      break;
    case "error":
      Get.snackbar(title, message,
          snackPosition: SnackPosition.TOP,
          colorText: Colors.white,
          backgroundColor: Colors.red);
      break;
  }
}

Future<String> getSharedPrefReturn(key) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  return prefs.getString(key).toString();
}

Future<void> saveSharedPref(key, value) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setString(key, value.toString());
}

Future<void> removeSharedPref(key) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  // Remove data for the key.
  await prefs.remove(key);
}
