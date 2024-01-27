import 'package:get/get.dart';
import 'package:task_tracker/ui/screen/sign_in/view.dart';

import '../../../../repositories/all_repository.dart';
import '../../../../utils/PreferenceUtils.dart';
import '../../../../utils/constansts.dart';
import '../../base_controller.dart';
import 'state.dart';

class ProfileViewLogic extends BaseController {
  final ProfileViewState state = ProfileViewState();

  @override
  void onReady() {
    super.onReady();
  }

  void logOut() async {
    try{
      await PreferenceUtils.init();
      var token = PreferenceUtils.getString("device_token");

      state.isLoading.value = true;
      var resp = await AllRepository.logout(token);
      if(resp.success??false){
        await PreferenceUtils.init();
        PreferenceUtils.setString('token', '');
        state.isLoading.value = false;
        update();
        Get.offAll(() => SignInPage());
      }

    }catch(e){

    }
  }

  userInfo () async{

  }
}
