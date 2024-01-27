import 'dart:async';

import 'package:flutter/animation.dart';
import 'package:get/get.dart';

import '../../../utils/PreferenceUtils.dart';
import '../../../utils/constansts.dart';
import '../base_controller.dart';
import '../dashboard/view.dart';
import '../sign_in/view.dart';
import 'state.dart';

class SplashScreenLogic extends BaseController {
  final SplashScreenState state = SplashScreenState();

  @override
  void onReady() {
    super.onReady();
    _splashScreenTimer();
  }
  _splashScreenTimer(){
    Timer( const Duration(seconds: AppConstants.SPLASH_SCREEN_DURATION), () async{
      //save token
      await PreferenceUtils.init();
      var token = PreferenceUtils.getString(AppConstants.PREF_KEY_AUTH_TOKEN);
      //Get.offAll(() => SignInPage(),transition: Transition.native,duration: const Duration(milliseconds: 500),curve:Curves.easeInCubic );
      if(token.isNotEmpty){
        Get.offAll(() => DashboardPage(),transition: Transition.native,duration: const Duration(milliseconds: 500),curve:Curves.easeInCubic );
      } else
        Get.offAll(() => SignInPage(),transition: Transition.native,duration: const Duration(milliseconds: 500),curve:Curves.easeInCubic );
    });
  }
}
