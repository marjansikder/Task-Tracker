import 'package:get/get.dart';
import '../../../../repositories/all_repository.dart';
import '../../base_controller.dart';
import 'state.dart';

class TaskListLogic extends BaseController {
  final TaskListState state = TaskListState();

  @override
  void refresh() {
    // TODO: implement refresh
    super.refresh();
  }

  @override
  void onReady() async{
    super.onReady();
    generateDates();
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

  void getBookingWithDates() {
    generateDates();
  }

  void generateDates(){
    List<DateTime> tempList = [];
    for( var i = 3 ; i > 0; i-- ) {
      tempList.add(DateTime(state.selectedDate.year,state.selectedDate.month,state.selectedDate.day-i));
    }
    tempList.add(state.selectedDate);
    for( var i = 1 ; i <= 3; i++ ) {
      tempList.add(DateTime(state.selectedDate.year,state.selectedDate.month,state.selectedDate.day+i));
    }
    state.dateTimeList.value.clear();
    state.dateTimeList.value = tempList;
    update();
  }
}
