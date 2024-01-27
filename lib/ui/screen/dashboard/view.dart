import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_tracker/ui/screen/dashboard/state.dart';
import 'package:task_tracker/ui/screen/profile/profile_view/view.dart';
import 'package:task_tracker/ui/screen/task/task_create/view.dart';
import 'package:task_tracker/ui/screen/task/task_list/view.dart';
import '../../../config/app_settings.dart';
import '../../../config/constants.dart';
import '../../../style/text_style.dart';
import '../../../style/theme.dart';
import '../../../utils/colors.dart';

import '../../customWidgets/root_containers.dart';
import '../task/task_home/view.dart';
import 'logic.dart';

class DashboardPage extends StatelessWidget {
  DashboardPage({Key? key}) : super(key: key);

  final logic = Get.put(DashboardLogic());
  final state = Get.find<DashboardLogic>().state;

  @override
  Widget build(BuildContext context) {
    return RootContainers.instance.getScaffoldRootContainer<Widget>(
        Obx(
              () =>
              Scaffold(
                floatingActionButton: Padding(
                  padding: const EdgeInsets.only(bottom: 70.0),
                  child: FloatingActionButton.extended(
                    backgroundColor: AppColors.textColor ,
                    heroTag: 'uniqueTag',
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(14),
                    ),
                    label: Row(
                      children: [Icon(Icons.add), Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: Text('Add Task' ,style: getArialTextStyle(
                            18, FontWeight.w500,
                            AppColors.white),),
                      )],
                    ),
                    onPressed: (){
                      Get.to(() => TaskCreatePage(),transition: Transition.native,duration: const Duration(milliseconds: 500),curve:Curves.easeInCubic );
                      //Get.to(() => ProfileViewPage(),transition: Transition.native,duration: const Duration(milliseconds: 500),curve:Curves.easeInCubic );
                    },
                  ),
                ),
                body: Container(
                  width: Get.width,
                  height: Get.height,
                  child: Stack(
                    children: [
                      if(state.dashState.value ==
                          DashBoardSateType.HOME.toString())
                        TaskHomePage()
                      else
                        if(state.dashState.value ==
                            DashBoardSateType.TASKS.toString())
                          TaskListPage()
                        else if(state.dashState.value ==
                              DashBoardSateType.PROFILE.toString())
                            ProfileViewPage(),
                      Positioned(bottom: 0, left: 0, right: 0,
                        child: Container(
                          height: ScreenWidth(context) * 0.25,
                          child: Stack(
                            children: [
                              Positioned(left: 0, right: 0, bottom: 0,
                                child: BottomNavWidget(controller: logic,
                                    state: state),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
        )
    );
  }
}

class BottomNavWidget extends StatelessWidget {
  const BottomNavWidget({
    required this.controller,
    required this.state,
  });
  final DashboardLogic controller;
  final DashboardState state;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      decoration: new BoxDecoration(
        color: Colors.white,
        border: Border.all(color: greyText),
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(0),
            topRight: Radius.circular(0),
            bottomLeft: Radius.circular(0),
            bottomRight: Radius.circular(0)),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            spreadRadius: 0.3,
            blurRadius: 20,
            offset: Offset(
                0, -3), // changes position of shadow
          ),
        ],
      ),
      child: Container(
        margin: EdgeInsets.only(top: 10,left: 25,right: 25),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment
              .center,
          mainAxisAlignment: MainAxisAlignment
              .spaceBetween,
          children: [
            Expanded(
              child: GestureDetector(
                onTap: () {
                  print('>>>');
                  controller.logicOfTab(0);
                  controller.setPage(
                      DashBoardSateType
                          .HOME
                          .toString());
                },
                child: Obx(() {
                  return Container(
                    margin: EdgeInsets.only(
                        left: 0),
                    child: Column(
                      children: [
                        ImageIcon(
                            AssetImage(ImageLocation.dashboard + "/dashboard_home.png"),
                            size: 22,
                            color: state.listOfColor[0]
                        ),
                        Container(
                          margin: EdgeInsets.only(
                              top: 4),
                          child: Text(
                              'Home'.tr,
                              textAlign: TextAlign
                                  .left,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: getArialTextStyle(
                                  10, FontWeight.w500, state.listOfColor[0])
                          ),
                        ),
                      ],
                    ),
                  );
                }),
              ),
            ),
            Expanded(
              child: GestureDetector(
                onTap: () {
                  print('>>>');
                  controller.logicOfTab(1);
                  controller.setPage(
                      DashBoardSateType
                          .TASKS
                          .toString());
                },
                child: Obx(() {
                  return Container(
                    margin: EdgeInsets.only(
                        left: 0),
                    child: Column(
                      children: [
                        ImageIcon(
                            AssetImage(ImageLocation.dashboard + "/dashboard_task.png"),
                            size: 22,
                            color: state.listOfColor[1]
                        ),
                        Container(
                          margin: EdgeInsets.only(
                              top: 4),
                          child: Text(
                              'Tasks'.tr,
                              textAlign: TextAlign.left,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: getArialTextStyle(
                                  10, FontWeight.w500, state.listOfColor[1])
                          ),
                        ),
                      ],
                    ),
                  );
                }
                ),
              ),
            ),
            Expanded(
              child: GestureDetector(
                onTap: () {
                  print('>>>');
                  controller.logicOfTab(2);
                  controller.setPage(
                      DashBoardSateType.PROFILE
                          .toString());


                  //BlocProvider.of<DashboardBloc>(context).add(DashboardStateChange(dash_state: DashBoardSateType.PRACTICE.toString()));
                },
                child: Obx(() {
                  return Column(
                    children: [
                      Icon(Icons.account_circle_outlined,
                          size: 22,
                          color: state.listOfColor[2]
                      ),
                      Container(
                        margin: EdgeInsets.only(
                            top: 4),
                        child: Text(
                            'Profile'.tr,
                            textAlign: TextAlign
                                .left,
                            style: getArialTextStyle(
                                10, FontWeight.w500, state.listOfColor[2])
                        ),
                      ),
                    ],
                  );
                }),
              ),
            ),
          ],
        ),
      ),
    );
  }

}


