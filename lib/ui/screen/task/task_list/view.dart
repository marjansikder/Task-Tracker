import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import '../../../../config/app_settings.dart';
import '../../../../models/task_list_response.dart';
import '../../../../style/text_style.dart';
import '../../../../style/theme.dart';
import '../../../../utils/colors.dart';
import '../../../../utils/text_style.dart';
import '../../../customWidgets/root_containers.dart';
import '../task_details/view.dart';
import 'logic.dart';

class TaskListPage extends StatelessWidget {
  TaskListPage({Key? key}) : super(key: key);

  final logic = Get.put(TaskListLogic());
  final state = Get.find<TaskListLogic>().state;

  Widget _taskList(TaskData? data,int index) {
    return GestureDetector(
      onTap: (){
        Get.to(() => TaskDetailsPage(),
            arguments: [
              data.sId,
              data.title,
              data.description,
              data.dueDate,
              data.completed
            ],
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

  List<Widget> _dateTime(List<DateTime> dateTimes) {
    List<Widget> totalDateWidgets = [];
    dateTimes.forEach((element) {
      var dateNumber = DateFormat('dd').format(
          element);
      var dayText = DateFormat('E').format(element).toUpperCase();
      bool isCenter = dateTimes.indexOf(element) == 3 ? true : false;
      bool isLessThenToday = false;

      if(element.year <= DateTime.now().year){
        if (element.month < DateTime.now().month)
          isLessThenToday = true;
        else if (element.month == DateTime.now().month) {
          if (element.day < DateTime.now().day)
            isLessThenToday = true;
        }
      }
      double itemWidth = Get.width / 7;
      totalDateWidgets.add(
          InkWell(
            onTap: () {
              if (!isLessThenToday) {
                state.selectedDate = element;
                logic.getBookingWithDates();
                logic.update();
              }
            },
            child: Container(
              width: isCenter ? itemWidth : itemWidth - 8,
              padding: EdgeInsets.symmetric(vertical: 5),
              margin: EdgeInsets.symmetric(horizontal: isCenter ? 6.0 : 0.0),
              decoration: BoxDecoration(
                  color: isCenter ? AppColors.textColor : null,
                  borderRadius: BorderRadius.all(Radius.circular(24)),
                 // border: Border.all(color: AppColors.borderLine, width: 1),
              ),
              child: Column(
                children: [
                  Text(
                    dayText,
                    style: getTextStyle2(14, FontWeight.w500,
                        isLessThenToday ? greyText : (isCenter
                            ? Colors.white
                            : AppColors.textGmail)),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    softWrap: false,),
                  SizedBox(
                    height: 10,
                  ),
                  Text(dateNumber,
                    style: getTextStyle2(14, FontWeight.w500,
                        isLessThenToday ? greyText : (isCenter
                            ? Colors.white
                            : AppColors.textGmail)),),

                ],
              ),
            ),
          ));
    });
    return totalDateWidgets;
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
                  SizedBox(
                    height: 10,
                  ),
                  Align(
                      alignment: Alignment.topLeft,
                      child: Text('Tasks', style: getArialTextStyle(
                          24, FontWeight.w700,
                          AppColors.black),)),
                  Align(
                      alignment: Alignment.topLeft,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 15.0),
                        child: Row(
                          children: [
                            Text(state.selectDate.value, style: getArialTextStyle(
                                16, FontWeight.bold,
                                AppColors.black),),
                            SizedBox(
                              width: 10,
                            ),
                            Image(image: AssetImage(
                                ImageLocation.others + "/Vector.png"),width: 16,height: 20,color: AppColors.black,),
                          ],
                        ),
                      )),
                  Obx(() {
                    return Container(
                      child: Row(
                        children: _dateTime(state.dateTimeList.value),
                      ),
                    );
                  }),

                  SizedBox(
                    height: 15,
                  ),
                  Expanded(
                      child:Obx(() => state.isLoading.value ? const Center(child: CircularProgressIndicator()) : ListView.builder(
                         padding: const EdgeInsets.only(bottom: 100),
                          physics: const BouncingScrollPhysics(),
                          controller: state.scrollController,
                          scrollDirection: Axis.vertical,
                          itemCount: state.taskListResponse.value?.data?.length ?? 0,
                          shrinkWrap: true,
                          itemBuilder: (BuildContext context, int index) {
                            return _taskList(state.taskListResponse.value?.data![index],index);
                          }))
                  ),
                ],
              ),
            ),
          ),
        )
    );
  }
}
