import 'package:flutter/cupertino.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:intl/intl.dart';

import '../../../../models/task_list_response.dart';
import '../../base_states.dart';

class TaskListState extends BaseState {
  TaskListState() {
    ///Initialize variables
  }
  ScrollController scrollController = ScrollController();
  DateTime selectedDate = DateTime.now();
  var dateTimeList = Rx<List<DateTime>>(<DateTime>[]);
  var selectDate = Rx<String>(DateFormat("EEEE, MMMM dd, yyyy").format(DateTime.now()));
  var taskListResponse = Rxn<TaskListResponse>();
}
