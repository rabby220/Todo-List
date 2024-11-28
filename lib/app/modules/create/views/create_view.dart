import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../utils/app_color.dart';
import '../../../utils/app_text.dart';
import '../controllers/create_controller.dart';

class CreateView extends GetView<CreateController> {
  const CreateView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.blackColor,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: AppColor.blackColor,
        titleTextStyle: AppText.darkTitleTextStyle,
        leading: BackButton(
          color: AppColor.whiteColor,
          onPressed: () {
            Get.toNamed('/home');
          },
        ),
        toolbarHeight: 100.0,
        title: const Text(
          AppText.createTaskText,
        ),
      ),
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 50.0),
                TextField(
                  maxLines: 3,
                  controller: controller.addTask,
                  keyboardType: TextInputType.text,
                  maxLength: 50,style: AppText.createInputTitleTextStyle,
                  //   textCapitalization: TextCapitalization.words,
                  decoration: const InputDecoration(
                    hintText: AppText.hintAddTaskText,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(15.0),),
                      borderSide: BorderSide(
                        color: Colors.green,
                        width: 1.0,
                        style: BorderStyle.solid,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 50.0),

                ///Add Task Button....
                MaterialButton(
                  onPressed: () {
                    if (controller.addTask.text.isEmpty) {
                      snapshotController(
                          'Tasks Needed',
                          'What\'s your task?',
                          SnackPosition.BOTTOM,
                          AppColor.redColor,
                          const Duration(milliseconds: 1000),
                          3.0,
                          AppColor.blackColor,
                          180.0
                      );
                    } else {
                      controller.addTodo();
                      Get.offAllNamed('/home');
                      snapshotController(
                          'Create Successfully',
                          'Task Created Successfully',
                          SnackPosition.BOTTOM,
                          AppColor.greenColor,
                          const Duration(milliseconds: 1000),
                          3.0,
                          AppColor.blackColor,
                          300.0

                      );
                    }
                  },
                  minWidth: double.infinity,

                  textColor: AppColor.whiteColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    side: const BorderSide(
                      width: 1,
                      color: Colors.green,
                    ),
                  ),
                  padding: const EdgeInsets.symmetric(
                    vertical: 15.0,
                  ),
                  child: const Text(AppText.addTaskText),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  SnackbarController snapshotController(
      String title,
      String message,
      SnackPosition position,
      Color textColor,
      Duration duration,
      double blur,
      Color bg,
      double maxWidth,
      ) {
    return Get.snackbar(title, message,
        snackPosition: position,
        colorText: textColor,
        duration: duration,
        overlayBlur: blur,
        backgroundColor: bg,
        maxWidth: maxWidth
    );
  }
}