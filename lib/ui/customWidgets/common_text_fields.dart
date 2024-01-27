import 'package:flutter/material.dart';

import '../../style/text_style.dart';
import '../../style/theme.dart';

class CommonTextFields{
  CommonTextFields._privateConstructor();
  static final CommonTextFields _instance = CommonTextFields._privateConstructor();
  static CommonTextFields get instance => _instance;

  TextField getCommonTextView(TextEditingController textEditingController,String hintText,{Color? textColor, double? textSize,EdgeInsets? contentPadding,TextInputType? inputType,int? maxLength,int? maxLines}) => TextField(
    controller: textEditingController,
    keyboardType: TextInputType.multiline,
    maxLength: 500,
    maxLines : maxLines ,
    decoration: InputDecoration(
      isDense: true,
      hintText: hintText,
      hintStyle:  getArialTextStyle(
          16, FontWeight.w300, AppColors.borderLine),
      border: InputBorder.none,
      counterText: '',
      contentPadding: contentPadding??EdgeInsets.symmetric(horizontal: 0,vertical: 6),
    ),
    style: getArialTextStyle(
        18, FontWeight.w500, AppColors.black),
  );
}