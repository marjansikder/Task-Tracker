import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../style/text_style.dart';
import '../../../../style/theme.dart';
import '../../../../utils/CustomDatePicker.dart';
import '../../../../utils/constansts.dart';
import '../../../customWidgets/common_text_fields.dart';
import '../../../customWidgets/root_containers.dart';
import '../../sign_up/view.dart';
import 'logic.dart';

class TaskCreatePage extends StatelessWidget {
  TaskCreatePage({Key? key}) : super(key: key);

  final logic = Get.put(TaskCreateLogic());
  final state = Get.find<TaskCreateLogic>().state;

  @override
  Widget build(BuildContext context) {
    return RootContainers.instance.getScaffoldRootContainer(
        Container(
          color: AppColors.priceShowColor.withOpacity(.6),
          height: Get.height,
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.symmetric(vertical: 20,horizontal: 12),
                child: Row(
                  children: [
                    SizedBox(
                      width: 8,
                    ),
                    GestureDetector(
                      onTap: (){
                        Get.back();
                      },
                        child: Icon(Icons.arrow_back_ios,color: Colors.black)),
                    SizedBox(
                      width: 8,
                    ),
                    Text('New Task', style: getArialTextStyle(
                        23, FontWeight.w500,
                        AppColors.black),)
                  ],

                ),
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 15, right: 15 ),
                        child: Column(
                            children: [
                              Align(
                                  alignment: Alignment.topLeft,
                                  child: Padding(
                                    padding: const EdgeInsets.only(bottom: 10.0,top: 10),
                                    child: Text(
                                      'Title', style: getArialTextStyle(
                                        14, FontWeight.w400,
                                        AppColors.textTitle),),
                                  )),
                              Container(
                                height: 56,
                                width: Get.width,
                                decoration: BoxDecoration(
                                    color: AppColors.white.withOpacity(
                                        .9),
                                    borderRadius: BorderRadius.circular(14),
                                    border: Border.all(color: AppColors.borderLine,width: 1)
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      left: 18, right: 18, top: 10),
                                  child: CommonTextFields.instance.getCommonTextView(
                                      state.titleController,
                                      AppStrings.TITLE,
                                      textColor: AppColors.hintTextColor,
                                      inputType: TextInputType.name),
                                ),
                              ),
                              Align(
                                  alignment: Alignment.topLeft,
                                  child: Padding(
                                    padding: const EdgeInsets.only(bottom: 10.0,top: 10),
                                    child: Text(
                                      'Date', style: getArialTextStyle(
                                        14, FontWeight.w400,
                                        AppColors.textTitle),),
                                  )),
                              Container(
                                width: Get.width,
                                decoration: BoxDecoration(
                                    color: AppColors.white,
                                    border: Border.all(color: AppColors.borderLine,width: 1),
                                    borderRadius: new BorderRadius.all(Radius.circular(14.0),
                                    )
                                ),
                                padding: EdgeInsets.only(left: 20, right: 20),
                                height: 60,
                                child: CustomDatePicker((text) {
                                  state.selectDate.value = text;
                                }, DateTime(DateTime.now().year + 100),
                                    DateTime(DateTime.now().year - 100),
                                    DateTime(DateTime.now().year)),
                              ),
                              Align(
                                  alignment: Alignment.topLeft,
                                  child: Padding(
                                    padding: const EdgeInsets.only(bottom: 10.0,top: 30),
                                    child: Text(
                                      'Description', style: getArialTextStyle(
                                        14, FontWeight.w400,
                                        AppColors.textTitle),),
                                  )),
                              Container(
                                height: Get.height * .2,
                                width: Get.width,
                                decoration: BoxDecoration(
                                    color: AppColors.white.withOpacity(
                                        .9),
                                    borderRadius: BorderRadius.circular(14),
                                    border: Border.all(color: AppColors.borderLine,width: 1)
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      left: 18, right: 18, top: 10),
                                  child: CommonTextFields.instance.getCommonTextView(
                                      state.descriptionController,
                                      AppStrings.DESCRIPTION,
                                      textColor: AppColors.hintTextColor,
                                      maxLength: 20,
                                      inputType: TextInputType.name),
                                ),
                              ),
                              SizedBox(
                                height: Get.height * .2,
                              ),
                              GestureDetector(
                                onTap: () {
                                  logic.onSubmit();
                                },
                                child: Container(
                                    width: Get.width,
                                    decoration: ContainerBoxDecorations.instance.getButtonBoxDecoration(bgColor: AppColors.textColor),
                                    padding: const EdgeInsets.symmetric(vertical: AppSizes.buttonPaddingVertical),
                                    child: Align(
                                      alignment: Alignment.center,
                                      child: Text('Create Task',style: getTextStyleDisplay(14,FontWeight.normal,AppColors.white),),
                                    )
                                ),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                            ]),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        )
    );
}
}
