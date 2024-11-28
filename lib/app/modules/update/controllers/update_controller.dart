import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import '../../../data/models/todo_model.dart';

class UpdateController extends GetxController {
  final updateTitleController = TextEditingController();

  final Box box = Hive.box('peopleBox');

  Future<void> updateTask(index) async {
    DateTime updateAt = DateTime.now();
    box.putAt(
      index,
      TodoModel(
        title: updateTitleController.text,
        createAt: updateAt,
      ),
    );
  }
}