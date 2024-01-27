import 'package:flutter/animation.dart';
import 'package:get/get.dart';
import 'package:task_tracker/ui/screen/dashboard/view.dart';
import 'package:task_tracker/ui/screen/task/task_home/view.dart';

import '../../../../config/constants.dart';
import '../../../../repositories/all_repository.dart';
import '../../base_controller.dart';
import 'state.dart';

class TaskCreateLogic extends BaseController {
  final TaskCreateState state = TaskCreateState();


  List<String> checkFormValidation(){
    List<String> errors = [];
    if(state.titleController.text.isEmpty){
      errors.add('Title Field is empty!');
    }
    if(state.descriptionController.text.isEmpty){
      errors.add('Description Field is empty!');
    }
    if(state.selectDate.value.isEmpty){
      errors.add('Date Field is empty!');
    }
    return errors;
  }

  void onSubmit() async{
    var validation = checkFormValidation();
    if(validation.isEmpty){
       createTask();
    }else{
      ShowDialogSingleButton('Error', validation.join('\n'),
          onConfirm: (){
            Get.back();
          },
          onCancel: () {
            Get.back();
          });
    }
  }

  void createTask() async{
    try{
      state.isLoading.value = true;
      var resp = await AllRepository.taskAdd(
        state.titleController.text,
        state.descriptionController.text,
        state.selectDate.value
      );
      state.isLoading.value = false;
      if(resp.success == true){
        showSingleCustomDialogBox(Get.context!,'Success'.tr, "${resp.success == true? 'Successfully Added!':"Something went wrong"}",null,null,
            onConfirm: (){
              Get.offAll(() => DashboardPage(),transition: Transition.native,duration: const Duration(milliseconds: 500),curve:Curves.easeInCubic );
            });
      }else{

      }
    }catch(e){
      state.isLoading.value = false;

    }
  }
}
