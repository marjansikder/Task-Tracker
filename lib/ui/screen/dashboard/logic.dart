
import '../../../config/constants.dart';
import '../base_controller.dart';
import 'state.dart';

class DashboardLogic extends BaseController {
  final DashboardState state = DashboardState();

  void onItemTapped(int index) {
      state.selectedIndex = index;
  }

  setPage(String value){
    if(value == DashBoardSateType.HOME.toString()){
      state.dashState.value = DashBoardSateType.HOME.toString();
    }else if(value == DashBoardSateType.TASKS.toString()){
      state.dashState.value = DashBoardSateType.TASKS.toString();
    }
    else if(value == DashBoardSateType.PROFILE.toString()){
      state.dashState.value = DashBoardSateType.PROFILE.toString();
  }}

  logicOfTab(int currentIndex){
    print(currentIndex);
    //state.onBottomClick = true;
    state.currentIndex.value = currentIndex;

    for(int i = 0 ; i < state.listOfColor.length; i++){
      if(i==currentIndex){
        state.listOfColor[i] = state.selectedColor;
      }else{
        state.listOfColor[i] = state.unselectedColor;
      }
    }

    update();
  }
}
