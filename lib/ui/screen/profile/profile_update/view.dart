
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_tracker/ui/customWidgets/common_buttons.dart';

import '../../../../config/app_settings.dart';
import '../../../../style/text_style.dart';
import '../../../../style/theme.dart';
import '../../../../utils/constansts.dart';
import '../../../customWidgets/common_text_fields.dart';
import '../../../customWidgets/root_containers.dart';
import 'logic.dart';

class ProfileUpdatePage extends StatelessWidget {
  ProfileUpdatePage({Key? key}) : super(key: key);

  final logic = Get.put(ProfileUpdateLogic());
  final state = Get.find<ProfileUpdateLogic>().state;

  @override
  Widget build(BuildContext context) {
    return RootContainers.instance.getScaffoldRootContainer(Container(
      color: AppColors.priceShowColor.withOpacity(.3),
      height: Get.height,
      child: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.symmetric(vertical: 20, horizontal: 12),
              child: Row(
                children: [
                  SizedBox(
                    width: 8,
                  ),
                  GestureDetector(
                    onTap: (){
                      Get.back();
                    },
                      child: Icon(Icons.arrow_back_ios, color: Colors.black)),
                  SizedBox(
                    width: 8,
                  ),
                  Text(
                    'Profile',
                    style:
                    getArialTextStyle(23, FontWeight.w500, AppColors.black),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Container(
                decoration:  BoxDecoration(
                      borderRadius: BorderRadius.circular(14),
                  image: DecorationImage(
                    image: AssetImage(ImageLocation.others + "/background_image.png"),
                    fit: BoxFit.fill,
                  ),
                ),
                child: Column(
                  children: [
                    Padding(
                      padding:
                      const EdgeInsets.only(left: 15, right: 15, top: 10),
                      child: Column(children: [
                        Container(
                          margin: EdgeInsets.only(
                              bottom: 25,
                              top: 25),
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: AppColors.textColor,
                            shape: BoxShape.circle,
                          ),
                          child: Stack(
                            children: [
                              Image(
                                image: AssetImage(
                                    ImageLocation.dashboard + "/profile_image.png"),
                              ),
                              Positioned(
                                bottom: 10,
                                right: 0,
                                child: Container(
                                    width: 40, height: 40,
                                    decoration: new BoxDecoration(
                                      color: AppColors.white,
                                      borderRadius: new BorderRadius
                                          .all(
                                          Radius.elliptical(
                                              50, 50)),
                                    ),
                                    child: Center(
                                        child: Image(
                                          image: AssetImage(
                                              ImageLocation.others + "/camera_icon.png"),
                                        )
                                    )
                                ),
                              )
                            ],
                          ),
                        ),
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
                                state.nameController,
                                AppStrings.NAME_HINT,
                                textColor: AppColors.hintTextColor,
                                inputType: TextInputType.name),
                          ),
                        ),
                        Align(
                            alignment: Alignment.topLeft,
                            child: Padding(
                              padding:
                              const EdgeInsets.only(bottom: 10.0, top: 10),
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
                                maxLength: 20,
                                inputType: TextInputType.name),
                          ),
                        ),
                        Align(
                            alignment: Alignment.topLeft,
                            child: Padding(
                              padding:
                              const EdgeInsets.only(bottom: 10.0, top: 10),
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
                                state.emailAddressController,
                                AppStrings.AGE,
                                textColor: AppColors.hintTextColor,
                                inputType: TextInputType.name),
                          ),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        Obx(() {
                          return CommonButtons.instance.getAnimatedButton(
                              AppStrings.UPDATE,
                                  () => {
                                if (state.isButtonEnable.value)
                                  logic.updateApi()
                              },
                              state.isButtonEnable.value);
                        }),
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
      ),
    ));
  }
}
