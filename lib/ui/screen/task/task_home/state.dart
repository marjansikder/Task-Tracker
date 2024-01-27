import 'package:flutter/cupertino.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';

import '../../../../models/task_list_response.dart';
import '../../base_states.dart';

class TaskHomeState extends BaseState {
  TaskHomeState() {
    ///Initialize variables
  }

  ScrollController scrollController = ScrollController();
  var taskListResponse = Rxn<TaskListResponse>();
}
