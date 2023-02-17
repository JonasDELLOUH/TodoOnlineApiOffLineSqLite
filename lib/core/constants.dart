import 'package:flutter/material.dart';
  ///Url
  String originUrl = "http://192.168.1.193:3030/";
  String authenticationUrl = "${originUrl}authentication/";
  String registerUrl = "${originUrl}users/";
  String todoUrl = "${originUrl}todos/";

  /// Todo
  const String todoId = "id";
  const String todoTitle = "title";
  const String todoDescription = "description";
  const String todoPriority = "priority";
  const String todoBeginDate = "begined_at";
  const String todoFinishedDate = "finished_at";
  const String todoDeadline = "deadline_at";
  const String todoUserId = "user_id";
  const String todoCreatedDate = "created_at";
  const String todoUpdateDate = "updated_at";