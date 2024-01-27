import 'package:flutter/cupertino.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import '../base_states.dart';

class SignUpState extends BaseState {
  SignUpState() {
    ///Initialize variables
  }

  TextEditingController nameAddressController =  TextEditingController(text: '');
  TextEditingController emailAddressController =  TextEditingController(text: '');
  TextEditingController passwordController =  TextEditingController(text: '');
  TextEditingController retypePasswordController =  TextEditingController(text: '');
  TextEditingController ageController =  TextEditingController(text: '');
  var isButtonEnable = Rx<bool>(false);
}
