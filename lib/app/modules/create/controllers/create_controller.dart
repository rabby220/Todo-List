import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';

import '../../../data/models/todo_model.dart';


class CreateController extends GetxController {
  final addTask = TextEditingController();

  final Box box = Hive.box('peopleBox');

  Future<void> addTodo() async {
    DateTime createAt = DateTime.now();
    box.add(
      TodoModel(
        title: addTask.text,
        createAt: createAt,
      ),
    );
  }
}