import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_tracker/ui/screen/sign_up/view.dart';
import '../../../style/text_style.dart';
import '../../../style/theme.dart';
import '../../../utils/constansts.dart';
import '../../customWidgets/common_text_fields.dart';
import '../../customWidgets/customActionBar.dart';
import '../../customWidgets/root_containers.dart';
import 'logic.dart';

class SignInPage extends StatelessWidget {
  SignInPage({Key? key}) : super(key: key);

  final logic = Get.put(SignInLogic());
  final state = Get.find<SignInLogic>().state;

  @override
  Widget build(BuildContext context) {
    return RootContainers.instance.getScaffoldRootContainer(
      Container(
        color: AppColors.priceShowColor.withOpacity(.6),
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
                      padding: const EdgeInsets.only(
                          left: 25, right: 25, top: 30),
                      child: Column(
                          children: [
                            Align(
                                alignment: Alignment.topLeft,
                                child: Text('Sign in', style: getArialTextStyle(
                                    23, FontWeight.w500,
                                    AppColors.textColor),)),
                            SizedBox(
                              height: 25,
                            ),
                            Align(
                                alignment: Alignment.topLeft,
                                child: Padding(
                                  padding: const EdgeInsets.only(bottom: 10.0,top: 10),
                                  child: Text(
                                    'Email', style: getArialTextStyle(
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
                                    state.emailAddressController,
                                    AppStrings.EMAIL_HINT,
                                    textColor: AppColors.hintTextColor,
                                    inputType: TextInputType.name),
                              ),
                            ),
                            Align(
                                alignment: Alignment.topLeft,
                                child: Padding(
                                  padding: const EdgeInsets.only(bottom: 10.0,top: 30),
                                  child: Text(
                                    'Password', style: getArialTextStyle(
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
                                    state.passwordController,
                                    AppStrings.PASSWORD_HINT,
                                    textColor: AppColors.hintTextColor,
                                    maxLength: 20,
                                    inputType: TextInputType.name),
                              ),
                            ),
                            SizedBox(
                              height: 30,
                            ),
                            InkWell(
                              onTap: () {
                                var validation = logic.checkFormValidation();
                                if(validation.isEmpty){
                                  logic.signInCall();
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
                                    child: Text(AppStrings.SIGN_IN,style: getTextStyleDisplay(14,FontWeight.normal,AppColors.white),),
                                  )
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Don\'t have an account? ', style: getArialTextStyle(
                                    14, FontWeight.w400,
                                    AppColors.textTitle),),
                                GestureDetector(
                                  onTap: (){
                                    Get.to(() => SignUpPage(), transition: Transition.native, duration: const Duration(milliseconds: 500), curve: Curves.easeInCubic);
                                  },
                                  child: Text('Sign up', style: getArialTextStyle(
                                      14, FontWeight.w400,
                                      AppColors.textColor),),
                                )
                              ],
                            ),
                          ]),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
