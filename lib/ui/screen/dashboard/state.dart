import 'dart:ui';
import 'package:get/get.dart';
import 'package:task_tracker/models/task_add_response.dart';
import '../../../config/constants.dart';
import '../base_states.dart';

class DashboardState extends BaseState {
  DashboardState() {
    ///Initialize variables
  }

  int selectedIndex = 0;

  var isLoading = false.obs;
  var dashState = DashBoardSateType.HOME.toString().obs;
  var unselectedColor = Color(0xFF979797);
  var selectedColor = Color(0xFF8C88CD);
  var listOfColor = [Color(0xFF8C88CD),Color(0xFF979797),Color(0xFF979797),Color(0xFF979797),Color(0xFF979797)].obs;
  var currentIndex = 2.obs;
  var appVersion = ''.obs;
  var taskAddResponse = Rxn<TaskAddResponse>();
}
