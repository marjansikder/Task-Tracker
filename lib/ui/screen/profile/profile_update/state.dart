import 'package:flutter/cupertino.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';

import '../../base_states.dart';

class ProfileUpdateState extends BaseState {
  ProfileUpdateState() {
    ///Initialize variables
  }

  TextEditingController nameController =  TextEditingController(text: '');
  TextEditingController emailAddressController =  TextEditingController(text: '');
  TextEditingController ageController =  TextEditingController(text: '');
  var isButtonEnable = Rx<bool>(false);
}
