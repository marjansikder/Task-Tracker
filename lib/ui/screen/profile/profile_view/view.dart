import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_tracker/ui/screen/profile/profile_update/view.dart';
import '../../../../config/app_settings.dart';
import '../../../../config/constants.dart';
import '../../../../style/text_style.dart';
import '../../../../style/theme.dart';
import '../../../customWidgets/root_containers.dart';
import '../../sign_in/logic.dart';
import 'logic.dart';

class ProfileViewPage extends StatelessWidget {
  ProfileViewPage({Key? key}) : super(key: key);

  final logic = Get.put(ProfileViewLogic());
  final state = Get.find<ProfileViewLogic>().state;
  final logic2 = Get.put(SignInLogic());
  final state2 = Get.find<SignInLogic>().state;

  @override
  Widget build(BuildContext context) {
    return RootContainers.instance.getScaffoldRootContainer(Container(
      color: AppColors.priceShowColor.withOpacity(.6),
      height: Get.height,
      child: Column(
        children: [
          Align(
            alignment: Alignment.topLeft,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 18.0,horizontal: 16),
              child: Text(
                'Profile',
                style:
                getArialTextStyle(23, FontWeight.w500, AppColors.black),
              ),
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15),
                child: Column(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          color: AppColors.white,
                          borderRadius: BorderRadius.circular(14),
                          border: Border.all(color: AppColors.textColor, width: 2)),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 12.0),
                        child: GestureDetector(
                          onTap: (){
                            Get.to(() => ProfileUpdatePage(),transition: Transition.native,duration: const Duration(milliseconds: 500),curve:Curves.easeInCubic );
                          },
                          child: ListTile(
                            leading: CircleAvatar(
                              backgroundColor: Color(0xff764abc),
                              radius: 35.0,
                              backgroundImage: AssetImage(
                                  ImageLocation.dashboard + "/profile_image.png"),
                            ),
                            title: Padding(
                              padding: const EdgeInsets.symmetric(vertical: 8.0),
                              child: Text(state2.user.value?.name ?? 'John Doe',
                                style: getArialTextStyle(
                                    24, FontWeight.w700, AppColors.textTitle),
                              ),
                            ),
                            subtitle: Text(
                              state2.user.value?.email ??  'john.doe@gmail.com',
                              style: getArialTextStyle(
                                  14, FontWeight.w400, AppColors.textGmail),
                            ),
                            trailing: Icon(
                              Icons.arrow_forward_ios,
                              color: AppColors.black,
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 20,),
                    GestureDetector(
                      onTap: (){
                        showCustomDialogBox(Get.context!,'Please Confirm'.tr, 'Want to Log out?'.tr,null,null,
                            onConfirm: (){
                              logic.logOut();
                            },
                            onCancel: () {
                              Get.back();
                            });
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            color: AppColors.white,
                            borderRadius: BorderRadius.circular(14),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 12.0,vertical: 28),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              SizedBox(width: 10,),
                              Image(image: AssetImage(
                                  ImageLocation.dashboard + "/log_out.png")),
                              SizedBox(width: 10,),
                              Text(
                                'Log Out',
                                style: getArialTextStyle(
                                    16, FontWeight.w500, AppColors.textColorBlack),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 28),
                      child: Text(
                        'Version: 1.0.0',
                        style: getArialTextStyle(
                            12, FontWeight.w500, AppColors.textGmail),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    ));
  }
}
