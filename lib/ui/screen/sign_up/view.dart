import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../style/text_style.dart';
import '../../../style/theme.dart';
import '../../../utils/constansts.dart';

import '../../customWidgets/common_text_fields.dart';
import '../../customWidgets/customActionBar.dart';
import '../../customWidgets/root_containers.dart';
import 'logic.dart';

class SignUpPage extends StatelessWidget {
  SignUpPage({Key? key}) : super(key: key);

  final logic = Get.put(SignUpLogic());
  final state = Get.find<SignUpLogic>().state;

  @override
  Widget build(BuildContext context) {
    return RootContainers.instance.getScaffoldRootContainer(Container(
      color: AppColors.priceShowColor.withOpacity(.3),
      height: Get.height,
      child: Column(
        children: [
          CustomActionbar('Invoice'.tr, () {
            Get.back();
          }),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 25, right: 25, top: 20),
                    child: Column(children: [
                      Align(
                          alignment: Alignment.topLeft,
                          child: Text(
                            'Sign up',
                            style: getArialTextStyle(
                                23, FontWeight.w500, AppColors.textColor),
                          )),
                      SizedBox(
                        height: 10,
                      ),
                      Align(
                          alignment: Alignment.topLeft,
                          child: Padding(
                            padding:
                                const EdgeInsets.only(bottom: 10.0, top: 10),
                            child: Text(
                              'Name',
                              style: getArialTextStyle(
                                  14, FontWeight.w400, AppColors.textTitle),
                            ),
                          )),
                      Container(
                        height: 56,
                        width: Get.width,
                        decoration: BoxDecoration(
                            color: AppColors.white.withOpacity(.9),
                            borderRadius: BorderRadius.circular(14),
                            border: Border.all(
                                color: AppColors.borderLine, width: 1)),
                        child: Padding(
                          padding: const EdgeInsets.only(
                              left: 18, right: 18, top: 10),
                          child: CommonTextFields.instance.getCommonTextView(
                              state.nameAddressController,
                              AppStrings.NAME_HINT,
                              textColor: AppColors.hintTextColor,
                              inputType: TextInputType.name),
                        ),
                      ),
                      Align(
                          alignment: Alignment.topLeft,
                          child: Padding(
                            padding:
                                const EdgeInsets.only(bottom: 10.0, top: 30),
                            child: Text(
                              'Email',
                              style: getArialTextStyle(
                                  14, FontWeight.w400, AppColors.textTitle),
                            ),
                          )),
                      Container(
                        height: 56,
                        width: Get.width,
                        decoration: BoxDecoration(
                            color: AppColors.white.withOpacity(.9),
                            borderRadius: BorderRadius.circular(14),
                            border: Border.all(
                                color: AppColors.borderLine, width: 1)),
                        child: Padding(
                          padding: const EdgeInsets.only(
                              left: 18, right: 18, top: 10),
                          child: CommonTextFields.instance.getCommonTextView(
                              state.emailAddressController,
                              AppStrings.EMAIL_HINT,
                              textColor: AppColors.hintTextColor,
                              inputType: TextInputType.name),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Align(
                          alignment: Alignment.topLeft,
                          child: Padding(
                            padding:
                                const EdgeInsets.only(bottom: 10.0, top: 10),
                            child: Text(
                              'Password',
                              style: getArialTextStyle(
                                  14, FontWeight.w400, AppColors.textTitle),
                            ),
                          )),
                      Container(
                        height: 56,
                        width: Get.width,
                        decoration: BoxDecoration(
                            color: AppColors.white.withOpacity(.9),
                            borderRadius: BorderRadius.circular(14),
                            border: Border.all(
                                color: AppColors.borderLine, width: 1)),
                        child: Padding(
                          padding: const EdgeInsets.only(
                              left: 18, right: 18, top: 10),
                          child: CommonTextFields.instance.getCommonTextView(
                              state.passwordController,
                              AppStrings.PASSWORD_HINT,
                              textColor: AppColors.hintTextColor,
                              inputType: TextInputType.name),
                        ),
                      ),
                      Align(
                          alignment: Alignment.topLeft,
                          child: Padding(
                            padding:
                                const EdgeInsets.only(bottom: 10.0, top: 30),
                            child: Text(
                              'Age',
                              style: getArialTextStyle(
                                  14, FontWeight.w400, AppColors.textTitle),
                            ),
                          )),
                      Container(
                        height: 56,
                        width: Get.width,
                        decoration: BoxDecoration(
                            color: AppColors.white.withOpacity(.9),
                            borderRadius: BorderRadius.circular(14),
                            border: Border.all(
                                color: AppColors.borderLine, width: 1)),
                        child: Padding(
                          padding: const EdgeInsets.only(
                              left: 18, right: 18, top: 10),
                          child: CommonTextFields.instance.getCommonTextView(
                              state.ageController,
                              AppStrings.RETYPE_PASSWORD_HINT,
                              textColor: AppColors.hintTextColor,
                              inputType: TextInputType.number),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      InkWell(
                        onTap: () {
                          var validation = logic.checkFormValidation();
                          if(validation.isEmpty){
                            logic.signUpCall();
                          }else{
                            ShowDialogSingleButton('Error', validation.join('\n'),
                                onConfirm: (){
                                  Get.back();
                                },
                                onCancel: () {
                                  Get.back();
                                });
                          }
                        },
                        child: Container(
                            width: Get.width,
                            decoration: ContainerBoxDecorations.instance.getButtonBoxDecoration(bgColor: AppColors.textColor),
                            padding:  EdgeInsets.symmetric(vertical: AppSizes.buttonPaddingVertical),
                            child: Align(
                              alignment: Alignment.center,
                              child: Text(AppStrings.SIGN_UP,style: getTextStyleDisplay(14,FontWeight.normal,AppColors.white),),
                            )
                        ),
                      ),
                      SizedBox(
                        height: 60,
                      ),
                    ]),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    ));
  }
}
