import 'package:flutter/animation.dart';
import 'package:get/get.dart';
import 'package:task_tracker/models/SignInResponse.dart';
import 'package:task_tracker/ui/screen/dashboard/view.dart';
import '../../../repositories/all_repository.dart';
import '../../../utils/PreferenceUtils.dart';
import '../../../utils/constansts.dart';
import '../base_controller.dart';
import 'state.dart';

class SignInLogic extends BaseController {
  final SignInState state = SignInState();


  @override
  void onReady() {
    super.onReady();

    state.emailAddressController.addListener(() {
      _formValidation();
    });
    state.passwordController.addListener(() {
      _formValidation();
    });
  }

  void _formValidation() {
    if (state.emailAddressController.text.isEmpty) {
      state.isButtonEnable.value = false;
    }
    else if (state.passwordController.text.isEmpty) {
      state.isButtonEnable.value = false;
      return;
  }
  }

  List<String> checkFormValidation(){
    List<String> errors = [];
    if(state.emailAddressController.text.isEmpty){
      errors.add('Type email!');
    }
    if(state.passwordController.text.isEmpty){
      errors.add('Type password!');
    }
    return errors;
  }

  void signInCall() async{
    await PreferenceUtils.init();
    try{
      state.isLoading.value = true;
      var resp = await AllRepository.signInApi(
          state.emailAddressController.text,
          state.passwordController.text,
      );
      state.isLoading.value = false;
      if(resp.token != null){
        var token = resp.token ?? '';
        PreferenceUtils.setString(AppConstants.PREF_KEY_AUTH_TOKEN,token);
        //save token
        PreferenceUtils.init();
        PreferenceUtils.getString(AppConstants.PREF_KEY_AUTH_TOKEN,token);
        Get.to(() => DashboardPage(), transition: Transition.native, duration: const Duration(milliseconds: 500), curve: Curves.easeInCubic);
      }else{

      }
    }catch(e){
      state.isLoading.value = false;

    }
  }

  }

