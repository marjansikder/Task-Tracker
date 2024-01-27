import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import '../../config/app_settings.dart';
import '../../style/text_style.dart';

class CustomActionbar extends StatelessWidget {
  final String headerString;
  Function? backPressed = null;
  Widget? rightView = null;
  CustomActionbar(this.headerString,this.backPressed,{this.rightView});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
    image: DecorationImage(
    image: AssetImage(ImageLocation.others + "/bg_app_bar.png"),
    fit: BoxFit.fill),),
      width: Get.width,
      child: Stack(
        children: [
          Visibility(
            visible: backPressed == null?false:true,
            child: GestureDetector(
                onTap:(){
                  if (backPressed != null) backPressed!.call();
                },
                child:Padding(
                  padding: const EdgeInsets.symmetric(vertical: 15.0,horizontal: 12),
                  child: Container(
                      height: 44,
                      width: 44,
                      decoration: BoxDecoration(
                          color: Color(0xFFFFFFFF).withOpacity(.6), borderRadius: BorderRadius.circular(100)),
                      child: Padding(
                        padding: EdgeInsets.only(left: 8.0),
                        child: Icon(Icons.arrow_back_ios,color: Colors.black54),
                      )),
                ),),
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.all(40.0),
              child: Image(image: AssetImage(
                  ImageLocation.dashboard + "/task_tracker_icon.png"),width: 100,height: 100,),
            ),
          ),
          Visibility(
            visible: rightView == null?false:true,
            child: Positioned(
              right: 10,
              child: rightView??Container()
            ),
          ),
        ],
      ),
    );
  }
}
