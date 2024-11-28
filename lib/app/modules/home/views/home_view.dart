import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:intl/intl.dart';
import 'package:lottie/lottie.dart';
import '../../../data/models/todo_model.dart';
import '../../../utils/app_color.dart';
import '../../../utils/app_icon.dart';
import '../../../utils/app_text.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.blackColor,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: AppColor.blackColor,
        titleTextStyle: AppText.darkTitleTextStyle,
        toolbarHeight: 100.0,
        automaticallyImplyLeading: false,
        title: _text(
          text: AppText.todoText,
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Get.toNamed('/create');
        },
        label: AppIcon.addIcon,
        backgroundColor: Colors.black,
        foregroundColor: AppColor.whiteColor,
        isExtended: true,
        elevation: 5.0,
        extendedPadding: const EdgeInsets.all(40.0),
        clipBehavior: Clip.antiAlias,
        tooltip: "Create Task",
        splashColor: AppColor.greenColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
          side: BorderSide(
            color: AppColor.greenColor,
            width: 1.0,
            style: BorderStyle.solid,
          ),
        ),
      ),

      ///body part...
      body: ValueListenableBuilder(
        valueListenable: controller.box.listenable(),
        builder: (_, box, child) {
          if (controller.box.isEmpty) {
            return SizedBox(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              child: Center(
                child: SingleChildScrollView(
                  physics: const NeverScrollableScrollPhysics(),
                  scrollDirection: Axis.vertical,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Lottie.asset('assets/anim/empty_box.json'),
                      _text(
                        text: AppText.emptyText,
                        style: AppText.darkTitleTextStyle,
                      ),
                    ],
                  ),
                ),
              ),
            );
          } else {
            return ListView.builder(
              shrinkWrap: true,
              itemCount: controller.box.length,
              itemBuilder: (_, index) {
                TodoModel todoItem = controller.box.getAt(index);
                return Card(
                  color: AppColor.blackColor,
                  elevation: 5.0,
                  shadowColor: AppColor.orangeColor,
                  child: ListTile(
                    titleTextStyle: AppText.darkTitleTextStyle,
                    subtitleTextStyle: AppText.whiteSubTitleTextStyle,
                    trailing: PopupMenuButton(
                      color: AppColor.blackColor,
                      itemBuilder: (_) => [
                        PopupMenuItem(
                          textStyle: AppText.subTitleTextStyle,
                          child: _text(text: AppText.editText),
                          onTap: () {
                            Get.toNamed('/update', arguments: index);
                          },
                        ),
                        PopupMenuItem(
                          textStyle: AppText.subTitleTextStyle,
                          child: _text(text: AppText.deleteText),
                          onTap: () {
                            controller.box.deleteAt(index);
                            Get.snackbar(
                              AppText.deleteHintTitleText,
                              AppText.deleteHintSubTitleText,
                              colorText: AppColor.redColor,
                              snackPosition: SnackPosition.BOTTOM,
                              backgroundColor: AppColor.blackColor,
                              duration: const Duration(milliseconds: 1000),
                              maxWidth: 300,
                            );
                          },
                        ),
                      ],
                    ),
                    title: Padding(
                      padding: const EdgeInsets.only(top: 20.0),
                      child: Center(
                        child: _text(
                          text: todoItem.title.toString(),
                        ),
                      ),
                    ),
                    subtitle: Padding(
                      padding: const EdgeInsets.only(top: 50.0, bottom: 20.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Flexible(
                            child: _text(
                              text: DateFormat.MMMMd().format(
                                  DateTime.parse(todoItem.createAt.toString())),
                            ),
                          ),
                          Flexible(
                            child: _text(
                              text: DateFormat.jm().format(
                                  DateTime.parse(todoItem.createAt.toString())),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
              scrollDirection: Axis.vertical,
            );
          }
        },
      ),
    );
  }

  Widget _text({required String text, TextStyle? style}) {
    return Text(
      text,
      style: style,
    );
  }
}