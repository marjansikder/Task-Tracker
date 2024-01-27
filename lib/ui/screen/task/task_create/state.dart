import 'package:flutter/cupertino.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:intl/intl.dart';

import '../../../../models/task_add_response.dart';
import '../../base_states.dart';

class TaskCreateState extends BaseState {
  TaskCreateState() {
    ///Initialize variables
  }

  TextEditingController titleController =  TextEditingController(text: '');
  TextEditingController descriptionController =  TextEditingController(text: '');
  var isButtonEnable = Rx<bool>(false);
  var selectDate = Rx<String>(DateFormat('yyyy-MM-dd').format(DateTime.now()));
  var taskAddResponse = Rxn<TaskAddResponse>();
}
