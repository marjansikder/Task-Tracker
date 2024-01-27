import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../config/app_settings.dart';
import 'logic.dart';

class SplashScreenPage extends StatelessWidget {
  SplashScreenPage({Key? key}) : super(key: key);

  final logic = Get.put(SplashScreenLogic());
  final state = Get.find<SplashScreenLogic>().state;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(ImageLocation.others + "/background_image.png"),
            fit: BoxFit.fill,
          ),
        ),
        child: Center(
          child: Image(image: AssetImage(
              ImageLocation.dashboard + "/task_tracker_icon.png"),width: 300,height: 150,),
        ),
      ),
    );
  }
}
