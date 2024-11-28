import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../utils/app_color.dart';
import '../../../utils/app_text.dart';
import '../controllers/update_controller.dart';

class UpdateView extends GetView<UpdateController> {
  const UpdateView({super.key});
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
          AppText.editAppBarTaskText,
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
                  controller: controller.updateTitleController,
                  keyboardType: TextInputType.text,
                  maxLength: 50,
                  maxLines: 3,
                  style: AppText.updateInputTitleTextStyle,
                  decoration: const InputDecoration(
                    hintText: AppText.hintUpdateTaskText,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(15.0)),
                      borderSide: BorderSide(
                        color: Colors.blue,
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
                    if (controller.updateTitleController.text.isEmpty) {
                      snapshotController(
                        'Update Task',
                        'Please enter your updated task.',
                        SnackPosition.BOTTOM,
                        AppColor.redColor,
                        AppColor.blackColor,
                        300.0,
                        const Duration(milliseconds: 1000),
                      );
                    } else {
                      controller.updateTask(Get.arguments);

                      Get.offAllNamed('/home');
                      snapshotController(
                        'Task Updated Successfully',
                        'Your task has been updated.',
                        SnackPosition.BOTTOM,
                        AppColor.blueColor,
                        AppColor.blackColor,//blackColor
                        300.0,
                        const Duration(milliseconds: 1000),
                      );
                    }
                  },
                  minWidth: double.infinity,
                  textColor: AppColor.whiteColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    side: BorderSide(
                      width: 1,
                      color: AppColor.blueColor,
                    ),
                  ),
                  padding: const EdgeInsets.symmetric(
                    vertical: 15.0,
                  ),
                  child: const Text(AppText.updateTaskText),
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
      Color bg,
      double maxWidth,
      Duration duration,
      ) {
    return Get.snackbar(
      title,
      message,
      snackPosition: position,
      colorText: textColor,
      backgroundColor: bg,
      maxWidth: maxWidth,
      duration: duration,
    );
  }
}