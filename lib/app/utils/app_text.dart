import 'package:flutter/material.dart';
import 'package:todo_list/app/utils/app_color.dart';

class AppText {
  static const String addTaskText = "Create Task";
  static const String hintAddTaskText = "Enter your task here...";
  static const String hintUpdateTaskText = "Update your task here...";
  static const String createTaskText = "New Task";
  static const String updateTaskText = "Update Task";
  static const String editAppBarTaskText = "Edit Task";
  static const String todoText = "Task Dashboard";
  static const String deleteText = "Delete";
  static const String editText = "Edit";

  static const String deleteHintTitleText = "Task Successfully Deleted";
  static const String deleteHintSubTitleText = "Your task has been deleted.";
  static const String emptyText = "No Tasks Yet";

  static TextStyle darkTitleTextStyle = TextStyle(
    color: AppColor.whiteColor,
    fontWeight: FontWeight.bold,
    fontSize: 20.0,
  );

  static TextStyle whiteSubTitleTextStyle = TextStyle(
    color: AppColor.whiteColor,
    fontWeight: FontWeight.normal,
    fontSize: 15.0,
  );

  static TextStyle subTitleTextStyle = TextStyle(
    color: AppColor.whiteColor,
    fontWeight: FontWeight.normal,
    fontSize: 15.0,
  );

  static TextStyle createInputTitleTextStyle = TextStyle(
    color: AppColor.greenColor,
    fontSize: 20.0,
  );

  static TextStyle updateInputTitleTextStyle = TextStyle(
    color: AppColor.blueColor,
    fontSize: 20.0,
  );
}
