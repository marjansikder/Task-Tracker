import 'package:get/get.dart';

import '../../../../repositories/all_repository.dart';
import '../../base_controller.dart';
import 'state.dart';

class TaskHomeLogic extends BaseController {
  final TaskHomeState state = TaskHomeState();

  @override
  void onReady() {
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
}
