import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:material_dialogs/material_dialogs.dart';
import 'package:url_launcher/url_launcher.dart';
import '../ui/customWidgets/root_containers.dart';
import '../utils/colors.dart';
import '../utils/text_style.dart';


const LNG_BD = 'bd';
const LANGUAGE = 'language';

const LNG_ENG_DETAIL = 'English';
const LNG_BD_DETAIL = 'Bangla';

const List localeList =[
  {'name':LNG_BD_DETAIL,'locale': Locale('bn','BD')},
  {'name':LNG_ENG_DETAIL,'locale': Locale('en','US')},
];


enum DashBoardSateType {HOME,TASKS, PROFILE}

const cBottomButtonHeight = 55.0;

const cBottomContainerColor = Color(0xFF32AA7C);
const cInactiveCardColor = Color(0xFF111328);
const cCardBackgroundColor = Color(0xFF1C1B2F);
const cActiveCardColor = Color(0xFF1C1B2F);
//logo.png#FF5954
const colorAccent2 = Color(0xFFF1524F);
const colorPrimary2 = Color(0xFF727171);
const colorStatusBar = Color(0xFF727171);
const cBackgroundCommon = Color(0xFFF6F6F6);
//
const colorGrey= Color(0xFF474D54);


//
const FONT_NAME = 'google_sans';
const FONT_NAME_BN = 'bangla';
const FONT_NAME_BN2 = 'bangla2';


//
const NO_INTERNET = 'NO_INTERNET';
const TIME_OUT_ERROR = 'NO_INTERNET';


double ScreenWidth(BuildContext context) {
return MediaQuery.of(context).size.width;
}

double ScreenHeight(BuildContext context) {
return MediaQuery.of(context).size.height;
}

void showCustomDialogBox(BuildContext context, String title,String errors,String? leftButtonText,String? rightButtonText,{required VoidCallback onConfirm, required VoidCallback onCancel}) {
  showDialog(
    barrierDismissible: false,
    context: context,
    builder: (BuildContext cxt) {
      return Align(
        alignment: Alignment.center,
        child: Padding(
          padding: EdgeInsets.all(36),
          child: Material(
            color: Colors.white,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12)),
            child: Padding(
              padding: EdgeInsets.only(top: 15),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(title,style: getTextStyle(20, FontWeight.bold, colorAccentLight),),
                  SizedBox(height: 20,),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12.0),
                    child: Text(errors,style: getTextStyle(14, FontWeight.normal, Colors.black),),
                  ),
                  SizedBox(height: 40,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Expanded(
                        child: GestureDetector(
                          onTap: onCancel,
                          child: Container(
                              decoration: BoxDecoration(
                                color: colorAccent,
                                borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(12),
                                ),
                              ),
                              height: 50,
                              child: Center(child: Text(leftButtonText??'Back'.tr,style: getTextStyle(14, FontWeight.bold, Colors.white),))
                          ),
                        ),
                      ),
                      Expanded(
                        child: GestureDetector(
                          onTap: onConfirm,
                          child: Container(
                              decoration: BoxDecoration(
                                color: colorPrimaryDark,
                                borderRadius: BorderRadius.only(
                                  bottomRight: Radius.circular(12),
                                ),
                              ),
                              height: 50,
                              child: Center(child: Text(rightButtonText??'Okay'.tr,style: getTextStyle(14, FontWeight.bold, Colors.white),))
                          ),
                        ),
                      )],
                  )
                ],
              ),
            ),
          ),
        ),
      );
    },
  );
}

void showSingleCustomDialogBox(BuildContext context, String title,String errors,String? leftButtonText,String? rightButtonText,{required VoidCallback onConfirm}) {
  showDialog(
    barrierDismissible: false,
    context: context,
    builder: (BuildContext cxt) {
      return Align(
        alignment: Alignment.center,
        child: Padding(
          padding: EdgeInsets.all(36),
          child: Material(
            color: Colors.white,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12)),
            child: Padding(
              padding: EdgeInsets.only(top: 15),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(title,style: getTextStyle(20, FontWeight.bold, colorAccentLight),),
                  SizedBox(height: 20,),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Text(errors,style: getTextStyle2(14, FontWeight.normal, Colors.black),),
                  ),
                  SizedBox(height: 40,),
                  GestureDetector(
                    onTap: onConfirm,
                    child: Container(
                        decoration: BoxDecoration(
                          color: colorPrimaryDark,
                          borderRadius: BorderRadius.only(
                            bottomRight: Radius.circular(12),
                            bottomLeft: Radius.circular(12),
                          ),
                        ),
                        height: 50,
                        child: Center(child: Text(rightButtonText??' OK '.tr,style: getTextStyle(14, FontWeight.bold, Colors.white),))
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      );
    },
  );
}


void ShowDialogSingleButton(String title, String body, {required VoidCallback onConfirm, required VoidCallback onCancel}){
  Get.defaultDialog(
    title: title,
    titleStyle: TextStyle(
        fontSize: 24.0,
        color: Colors.red,
        fontWeight: FontWeight.bold,
        letterSpacing: 1.0,
        fontFamily: FONT_NAME
    ),
    content: Padding(
      padding: const EdgeInsets.only(top: 16,right: 16,left: 16,bottom: 2),
      child: Text(
        body,
        textAlign: TextAlign.center,
        style: TextStyle(
            fontSize: 16.0,
            color: Colors.black,
            fontWeight: FontWeight.normal,
            fontFamily: FONT_NAME,
        ),
      ),
    ),
    confirm: Padding(
      padding: const EdgeInsets.only(left:24.0, right:24, top: 24, bottom: 24),
      child: GestureDetector(
        onTap: onConfirm,
        child: Container(
          width: 70,
          decoration:RootContainers.instance.getBoxDecorations(colorPrimaryDark,5) ,
          child: Center(
            child: Padding(
              padding: const EdgeInsets.only(top: 5,bottom: 5),
              child: Text(
                " OK ".tr,
                style: TextStyle(
                    fontSize: 16.0,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontFamily: FONT_NAME
                ),
              ),
            ),
          ),
        ),
      ),
    ),
  );
}

String dateToString(DateTime dateTime, DateFormat dobFormat){
  return dobFormat.format(dateTime);
}

DateTime stringToDate(String dateTimeStr, DateFormat dobFormat){
  return dobFormat.parse(dateTimeStr);
}


void showColoredToast(String msg) {
  Fluttertoast.showToast(
      msg: msg,
      toastLength: Toast.LENGTH_LONG,
      backgroundColor: Colors.black54,
      textColor: Colors.white);
}

void showWhiteToast(String msg) {
  Fluttertoast.showToast(
      msg: msg,
      toastLength: Toast.LENGTH_LONG,
      backgroundColor: Colors.white,
      textColor: Colors.black);
}


Future<void> buildAlertDialogWithChildren(BuildContext context, bool isFullScreen,
    String _alertTitle, String _alertText) {
  return Dialogs.materialDialog(
      msg: '${_alertText}',
      title: "${_alertTitle}",
      msgStyle: GoogleFonts.lato(
          color: Colors.black,
          fontSize: 14
      ),

      titleStyle: GoogleFonts.lato(
          color:colorPrimary2,
          fontSize: 20,
          fontWeight: FontWeight.bold
      ),
      barrierDismissible: true,
      color: Colors.white,
      context: context,
      actions: [
        TextButton(
          child: Text(
            'OK'.tr,
          ),
          onPressed: () {
            Navigator.pop(context);
            //Navigator.pop(context, DialogDemoAction.agree.toString());
          },
        ),
      ]);

}

Future<void> showAlertDialog(BuildContext context,
    String _alertTitle, String _alertText) {
  return Dialogs.materialDialog(
      msg: '${_alertText}',
      title: "${_alertTitle}",
      msgStyle: GoogleFonts.lato(
          color: Colors.black,
          fontSize: 14
      ),

      titleStyle: GoogleFonts.lato(
          color:colorAccent,
          fontSize: 20,
          fontWeight: FontWeight.bold
      ),
      barrierDismissible: true,
      color: lightGreen,
      context: context,
      actions: [
        TextButton(
          child: Text(
            'OK'.tr,
            style: Theme.of(context)
                .textTheme
                .button
                ?.copyWith(fontSize: 14.0, color: Theme.of(context).primaryColor),
          ),
          onPressed: () {
            Navigator.pop(context);
            //Navigator.pop(context, DialogDemoAction.agree.toString());
          },
        ),
      ]);

}