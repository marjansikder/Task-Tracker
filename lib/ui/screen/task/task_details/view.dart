import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../config/app_settings.dart';
import '../../../../config/constants.dart';
import '../../../../style/text_style.dart';
import '../../../../style/theme.dart';
import '../../../../utils/constansts.dart';
import '../../../customWidgets/common_text_fields.dart';
import '../../../customWidgets/root_containers.dart';
import 'logic.dart';

class TaskDetailsPage extends StatelessWidget {
  TaskDetailsPage({Key? key}) : super(key: key);

  final logic = Get.put(TaskDetailsLogic());
  final state = Get
      .find<TaskDetailsLogic>()
      .state;

  @override
  Widget build(BuildContext context) {
    return RootContainers.instance.getScaffoldRootContainer(
        Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 18.0),
              child: Container(
                  margin: EdgeInsets.only(bottom: 25),
                  decoration: RootContainers.instance.getBoxDecorations(
                      AppColors.white, 14),
                  padding: EdgeInsets.symmetric(vertical: 5, horizontal: 15),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              GestureDetector(
                                  onTap: () {
                                    Get.back();
                                  },
                                  child: Icon(Icons.arrow_back_ios,
                                      color: Colors.black)),
                              Container(
                                height: 30,
                                width: 120,
                                decoration: BoxDecoration(
                                  color: AppColors.white.withOpacity(
                                      .9),
                                  borderRadius: BorderRadius.circular(2),
                                ),
                                child: CommonTextFields.instance
                                    .getCommonTextView(
                                    state.titleController,
                                    AppStrings.DESCRIPTION,
                                    textColor: AppColors.hintTextColor,
                                    maxLength: 1,
                                    inputType: TextInputType.name),
                              ),
                              SizedBox(width: 4,),
                              Image(image: AssetImage(
                                  ImageLocation.dashboard + "/edit.png"),
                                width: 12,
                                height: 12,),
                            ],
                          ),
                          Container(
                            height: 20,
                            width: 26,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.all(Radius.circular(
                                    10)),
                                color: AppColors.borderLine,
                                border: Border.all(
                                    color: AppColors.textGray, width: 2)
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Row(
                        children: [
                          SizedBox(
                            width: 15,
                          ),
                          Row(
                            children: [
                              SizedBox(
                                width: 5,
                              ),
                              Icon(
                                Icons.access_time,
                                size: 16,
                                color: AppColors.textGray,
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Obx(() {
                                return Text(logic.dateFormationForDate(state.selectDate.toString()),
                                  style: getArialTextStyle(
                                      12, FontWeight.w400,
                                      AppColors.textGray),);
                              }),
                              SizedBox(
                                width: 10,
                              ),
                            ],
                          ),
                          state.isCompleted == true ?
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(Radius.circular(
                                  10)),
                              color: AppColors.yellowText.withOpacity(.2),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: Text('Completed', style: getArialTextStyle(
                                  8, FontWeight.bold,
                                  AppColors.yellowText),),
                            ),
                          ) : Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(Radius.circular(
                                  10)),
                              color: AppColors.yellowText.withOpacity(.2),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: Text(
                                'Incomplete', style: getArialTextStyle(
                                  8, FontWeight.bold,
                                  AppColors.yellowText),),
                            ),
                          )
                        ],
                      ),
                    ],
                  )
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: Container(
                height: Get.height * .3,
                width: Get.width,
                decoration: BoxDecoration(
                    color: AppColors.white.withOpacity(
                        .9),
                    borderRadius: BorderRadius.circular(14),
                    border: Border.all(color: AppColors.black, width: 1)
                ),
                child: Padding(
                  padding: const EdgeInsets.only(
                      left: 18, right: 18, top: 10),
                  child: CommonTextFields.instance.getCommonTextView(
                      state.descriptionController,
                      AppStrings.DESCRIPTION,
                      maxLines: 7,
                      textColor: AppColors.hintTextColor,
                      inputType: TextInputType.name),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 12.0, vertical: 18),
                  child: GestureDetector(
                    onTap: (){
                      showCustomDialogBox(Get.context!,'Please Confirm'.tr, 'Update this task?'.tr,null,null,
                          onConfirm: (){
                            logic.taskUpdateApiCall(state.taskId);
                            Get.back();
                          },
                          onCancel: () {
                            Get.back();
                          });
                    },
                    child: Container(
                      width: 160,
                      decoration: BoxDecoration(
                          color: AppColors.white,
                          borderRadius: BorderRadius.circular(28),
                          border: Border.all(color: AppColors.lineColor, width: 1)
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 14.0, horizontal: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Update Task',
                              style: getArialTextStyle(
                                  14, FontWeight.w400, AppColors.lineColor),
                            ),
                            Image(image: AssetImage(
                                ImageLocation.dashboard + "/edit.png"),
                              width: 16,
                              height: 18,),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 12.0, vertical: 18),
                  child: GestureDetector(
                    onTap: (){
                      showCustomDialogBox(Get.context!,'Please Confirm'.tr, 'Delete this task?'.tr,null,null,
                          onConfirm: (){
                            logic.deleteTask(state.taskId);
                            Get.back();
                          },
                          onCancel: () {
                            Get.back();
                          });
                    },
                    child: Container(
                      width: 160,
                      decoration: BoxDecoration(
                          color: AppColors.white,
                          borderRadius: BorderRadius.circular(28),
                          border: Border.all(color: AppColors.lineColor, width: 1)
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 14.0, horizontal: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Delete Task',
                              style: getArialTextStyle(
                                  14, FontWeight.w400, AppColors.lineColor),
                            ),
                            Image(image: AssetImage(
                                ImageLocation.dashboard + "/delete_icon.png"),
                              width: 16,
                              height: 18,),
                          ],
                        ),
                      ),
                    ),
                  ),
                )
              ],
            )
          ],
        )
    );
  }
}
