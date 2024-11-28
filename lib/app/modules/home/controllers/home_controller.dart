import 'package:get/get.dart';
import 'package:hive/hive.dart';

class HomeController extends GetxController {
  final Box box = Hive.box('peopleBox');
}