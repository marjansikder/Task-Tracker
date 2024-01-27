import 'package:task_tracker/models/task_add_response.dart';
import '../api/api_base_helper.dart';
import '../config/server_addresses.dart';
import '../models/SignInResponse.dart';
import '../models/common_resp.dart';
import '../models/task_list_response.dart';
import '../utils/PreferenceUtils.dart';


class AllRepository {
  static ApiBaseHelper _helper = ApiBaseHelper();

//sign in api:
  static Future<SignInResponse> signInApi(String email,String password) async{
    Map<String, dynamic> req = {"email": email,"password":password};
    final response = await _helper.post(ServerAddresses.userLogin,req);
    return SignInResponse.fromJson(response);
  }

//sign up api:
  static Future<SignInResponse> signUpApi(String name,String email,String password,String age) async{
    Map<String, dynamic> req = {
      "name": name,
      "email": email,
      "password":password,
      "age":age,
    };
    final response = await _helper.post(ServerAddresses.userSignUp,req);
    return SignInResponse.fromJson(response);
  }


//log out api:
  static Future<CommonResp> logout(String token) async {
    Map<String, dynamic> req = {"fcm_token": token};
    final response = await _helper.post(ServerAddresses.userLogOut, req, token: 'Bearer');
    return CommonResp.fromJson(response);
  }


//get Task List api :
  static Future<TaskListResponse> taskList() async{
    PreferenceUtils.init();
    final response = await _helper.get(ServerAddresses.taskList,token:'Bearer');
    return TaskListResponse.fromJson(response);
  }


//delete api :
  static Future<CommonResp> deleteTask(String id) async{
    Map<String,dynamic> req = {'id':id};
    final response = await _helper.delete('/task/$id',req,token: 'Bearer');
    return CommonResp.fromJson(response);
  }


//task add api :
  static Future<TaskAddResponse> taskAdd(
      String title,
      String description,
      String dueDate,
      ) async{
    Map<String, dynamic> req = {
      "title": title,
      "description": description,
      "dueDate": dueDate,
    };
    final response = await _helper.post(ServerAddresses.taskAdd,req,token: 'Bearer');
    return TaskAddResponse.fromJson(response);
  }

//task update api :
  static Future<CommonResp> taskUpdateApi(String id) async{
    Map<String,dynamic> req = {'id':id};
    final response = await _helper.put('/task/$id',req,token: 'Bearer');
    return CommonResp.fromJson(response);
  }


}



