import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../config/app_settings.dart';
import '../../../../models/task_list_response.dart';
import '../../../../style/text_style.dart';
import '../../../../style/theme.dart';
import '../../../customWidgets/root_containers.dart';
import '../task_details/view.dart';
import 'logic.dart';

class TaskHomePage extends StatelessWidget {
  TaskHomePage({Key? key}) : super(key: key);

  final logic = Get.put(TaskHomeLogic());
  final state = Get.find<TaskHomeLogic>().state;

  Widget _taskList(TaskData? data,int index) {
    return GestureDetector(
      onTap: (){
        Get.to(() => TaskDetailsPage(),
            arguments: [
              data.sId,
              data.title,
              data.description,
              data.dueDate,
              data.completed],
            transition: Transition.native,duration: const Duration(milliseconds: 500),curve:Curves.easeInCubic );
      },
      child: Container(
          margin: EdgeInsets.only(bottom: 25),
          decoration: RootContainers.instance.getBoxDecorations(
              AppColors.white, 14),
          padding: EdgeInsets.symmetric(vertical: 15,horizontal: 15),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(data!.title ?? '', style: getArialTextStyle(
                      20, FontWeight.w600,
                      AppColors.black),),
                  Container(
                    height: 20,
                    width: 26,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        color: AppColors.borderLine,
                        border: Border.all(color: AppColors.textGray,width: 2)
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 5,
              ),
              Row(
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.access_time,
                        size: 18,
                        color: AppColors.textGray,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(logic.dateFormationForDate(data.dueDate.toString() ?? ''), style: getArialTextStyle(
                          12, FontWeight.w400,
                          AppColors.textGray),),
                      SizedBox(
                        width: 10,
                      ),
                    ],
                  ),
                  data.completed == true ?
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      color: AppColors.yellowText.withOpacity(.2),
                    ),
                    child:Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Text('Completed', style: getArialTextStyle(
                          8, FontWeight.bold,
                          AppColors.yellowText),),
                    ),
                  ) : Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      color: AppColors.yellowText.withOpacity(.2),
                    ),
                    child:Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Text('Incomplete', style: getArialTextStyle(
                          8, FontWeight.bold,
                          AppColors.yellowText),),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 15,
              ),
              Align(
                alignment: Alignment.topLeft,
                child: Text(data.description ?? 'N/A',
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: getArialTextStyle(
                      14, FontWeight.w400,
                      AppColors.descriptionColor),),
              )
            ],
          )
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return RootContainers.instance.getScaffoldRootContainer(
        Scaffold(
          body: Container(
            color: AppColors.priceShowColor.withOpacity(.5),
            height: Get.height,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0,vertical: 12),
              child: Column(
                children: [
                  Align(
                      alignment: Alignment.topLeft,
                      child: Text('Hello!', style: getArialTextStyle(
                          24, FontWeight.bold,
                          AppColors.black),)),
                  SizedBox(
                    height: 8,
                  ),
                  Align(
                      alignment: Alignment.topLeft,
                      child: Text('Whats your plan for today ?', style: getArialTextStyle(
                          14, FontWeight.w500,
                          AppColors.textGray),)),
                  SizedBox(
                    height: 20,
                  ),
                  Align(
                      alignment: Alignment.topLeft,
                      child: Text('Task Summary', style: getArialTextStyle(
                          16, FontWeight.bold,
                          AppColors.black),)),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Image(image: AssetImage(
                          ImageLocation.dashboard + "/bg_1.png"),
                        width: Get.width * .45,
                      ),
                      Image(image: AssetImage(
                          ImageLocation.dashboard + "/bg_2.png"),
                        width: Get.width * .45,
                      )
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Align(
                      alignment: Alignment.topLeft,
                      child: Text('Tasks for the Day', style: getArialTextStyle(
                          16, FontWeight.bold,
                          AppColors.black),)),
                  SizedBox(
                    height: 15,
                  ),
                  Expanded(
                      child:Obx(() => state.isLoading.value ?  Center(child: CircularProgressIndicator()) : ListView.builder(
                          padding: const EdgeInsets.only(bottom: 100),
                          physics: const BouncingScrollPhysics(),
                          controller: state.scrollController,
                          scrollDirection: Axis.vertical,
                          itemCount: state.taskListResponse.value?.data?.length ?? 0,
                          shrinkWrap: true,
                          itemBuilder: (BuildContext context, int index) {
                            return _taskList(state.taskListResponse.value?.data![index],index);
                          }))
                  )
                ],
              ),
            ),
          ),
        )
    );
  }
}
