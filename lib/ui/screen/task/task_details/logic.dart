import 'package:flutter/animation.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../../config/constants.dart';
import '../../../../repositories/all_repository.dart';
import '../../base_controller.dart';
import '../../dashboard/view.dart';
import 'state.dart';

class TaskDetailsLogic extends BaseController {
  final TaskDetailsState state = TaskDetailsState();

  @override
  void onReady() {
    super.onReady();
    state.taskId = Get.arguments[0];
    state.titleController.text = Get.arguments[1];
    state.descriptionController.text = Get.arguments[2];
    state.selectDate.value = Get.arguments[3];
    state.isCompleted.value = Get.arguments[4];
    _setInitialData();
    _getTaskList();
  }

  void _getTaskList() async {
    try{
      state.isLoading.value = true;
      var resp = await AllRepository.taskList();
      state.isLoading.value = false;
      if(resp.data != null){

        state.taskListResponse.value = resp;

      }else{

      }
    }catch(e){
      print('?????');
      print('error ${e.toString()}');
      state.isLoading.value = false;
      update();


    }
  }

  void deleteTask(String id) async {
    try{
      state.isLoading.value = true;
      var resp = await AllRepository.deleteTask(id);
      state.isLoading.value = false;
      if(resp.message == 'success' ){

      }else{
        showSingleCustomDialogBox(Get.context!,'Success'.tr, "Deleted!",null,null,
            onConfirm: (){
              Get.offAll(() => DashboardPage(),transition: Transition.native,duration: const Duration(milliseconds: 500),curve:Curves.easeInCubic );
            });
      }
    }catch(e){
      state.isLoading.value = false;
      update();
      print('?????????????????');
      print(e.toString());
      showSingleCustomDialogBox(Get.context!,'Error'.tr, e.toString(),null,null,
          onConfirm: (){
            Get.back();
          });
    }
  }

  void taskUpdateApiCall(String id) async {
    try{
      state.isLoading.value = true;
      var resp = await AllRepository.taskUpdateApi(state.taskId);
      state.isLoading.value = false;
      if(resp.message == 'success' ){
        showSingleCustomDialogBox(Get.context!,''.tr, "${resp.message!.isNotEmpty?resp.message:"Something went wrong"}",null,null,
            onConfirm: (){
              Get.back();
              Get.back();
            });
      }else{

      }
    }catch(e){
      state.isLoading.value = false;
      update();
      print('?????????????????');
      print(e.toString());
      showSingleCustomDialogBox(Get.context!,'Error'.tr, e.toString(),null,null,
          onConfirm: (){
            Get.back();
          });
    }

  }

  _setInitialData(){
    state.titleController.text = state.titleController.text?? 'N/A';
    state.descriptionController.text = state.descriptionController.value.text?? 'N/A';
    state.selectDate.value = state.selectDate.value ??'N/A';
    state.isCompleted = state.isCompleted;
    update();
  }

  String dateFormationForBookingList(String? dateTime){
    if(dateTime != null) {
      var dateValue = DateFormat("yyyy-MM-dd hh:mm:ss","en").parse(dateTime);
      return DateFormat("dd MMM,yyyy").format(dateValue);
    }
    return "N/A";
  }
}
