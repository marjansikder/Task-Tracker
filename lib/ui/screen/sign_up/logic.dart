import 'package:flutter/animation.dart';
import 'package:get/get.dart';
import 'package:task_tracker/ui/screen/sign_in/view.dart';

import '../../../config/constants.dart';
import '../../../repositories/all_repository.dart';
import '../base_controller.dart';
import 'state.dart';

class SignUpLogic extends BaseController {
  final SignUpState state = SignUpState();

  @override
  void onReady() {
    super.onReady();
    state.nameAddressController.addListener(() {
      _formValidation();
    });
    state.emailAddressController.addListener(() {
      _formValidation();
    });
    state.passwordController.addListener(() {
      _formValidation();
    });
    state.retypePasswordController.addListener(() {
      _formValidation();
    });
  }

  void _formValidation() {
    if (state.nameAddressController.text.isEmpty) {
      state.isButtonEnable.value = false;
    }
    else if (state.emailAddressController.text.isEmpty) {
      state.isButtonEnable.value = false;
      return;
    } else if (!RegExp(
        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(state.emailAddressController.text)) {
      state.isButtonEnable.value = false;
      return;
    } else if (state.passwordController.text.isEmpty) {
      state.isButtonEnable.value = false;
      return;
    } else if (state.retypePasswordController.text.isEmpty) {
      state.isButtonEnable.value = false;
      return;
    }
  }

  List<String> checkFormValidation(){
    List<String> errors = [];
    if(state.nameAddressController.text.isEmpty){
      errors.add('Name Field is empty!');
    }
    if (!RegExp(
        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(state.emailAddressController.text)) {
      errors.add('Type correct email');
    }
    if(state.passwordController.text.isEmpty){
      errors.add('Type password!');
    }
    if(state.ageController.text.isEmpty){
      errors.add('Type age');
    }
    return errors;
  }

  void onSubmit() async{
    var validation = checkFormValidation();
    if(validation.isEmpty){
      signUpCall();
    }else{
      ShowDialogSingleButton('Error', validation.join('\n'),
          onConfirm: (){
            Get.back();
          },
          onCancel: () {
            Get.back();
          });
    }
  }

  void signUpCall() async{
    try{
      state.isLoading.value = true;
      var resp = await AllRepository.signUpApi(
        state.nameAddressController.text,
        state.emailAddressController.text,
        state.passwordController.text,
        state.ageController.text,
      );
      state.isLoading.value = false;
      if(resp.token != null){
        showSingleCustomDialogBox(Get.context!,'Success'.tr, "Registration Successful!\nplease sign in",null,null,
            onConfirm: (){
              Get.offAll(() => SignInPage(), transition: Transition.native, duration: const Duration(milliseconds: 500), curve: Curves.easeInCubic);
            });

      }else{

      }
    }catch(e){
      state.isLoading.value = false;

    }
  }
}
