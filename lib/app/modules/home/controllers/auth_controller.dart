import 'dart:convert';
import 'package:apiproject_getx/app/models/user_list.dart';
import 'package:apiproject_getx/app/modules/home/views/home_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import '../../../helpers/ApiHandler.dart';
import '../../../helpers/ErrorHandler.dart';
import '../../../models/user_all_experience.dart';
import '../../../models/user_experince.dart';
import '../../../models/user_login_data.dart';
import '../../../models/user_signup_data.dart';
import '../../../resources/Url_Resources.dart';

class authController extends GetxController {

  TextEditingController title = TextEditingController();
  TextEditingController company = TextEditingController();
  TextEditingController startDate = TextEditingController();
  TextEditingController endDate = TextEditingController();
  TextEditingController description = TextEditingController();
  TextEditingController search = TextEditingController();
  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController mobile = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController confirmPassword = TextEditingController();
  String role = '';

  final signInKey = GlobalKey<FormState>();

  // final signUpKey = GlobalKey<FormState>();
  // final otpKey = GlobalKey<FormState>();
  // final forgotKey = GlobalKey<FormState>();

  RxBool passwordVisible = true.obs;

  void passwordVisibility() {
    passwordVisible.value = !passwordVisible.value;
  }

  RxBool isLogin = false.obs;
  RxString isSuccess = "".obs;

  userLogin() async {
    try {
      var headers = {
        "Content-Type": "application/json",
        "Accept": "application/json"
      };
      await ApiHandler.postRequest(UrlResources.Login_user,
          body: jsonEncode(UserInputLogin(
              mobile: mobile.text.toString(),
              password: password.text.toString())
              .toJson()),
          headers: headers)
          .then((json) async {
        if (json["user"] == "isSuccess") {
          isLogin(true);
          isSuccess(json["message"].toString());
          var id = json["user"]["id"].toString();
          var name = json["user"]["name"].toString();
          var email = json["user"]["email"].toString();
          var token = json["user"]["token"].toString();

          SharedPreferences prefs = await SharedPreferences.getInstance();
          prefs.setString("isLogin", "yes");

          prefs.setString("id", id);
          prefs.setString("name", name);
          prefs.setString("email", email);
          prefs.setString("token", token);
        } else {
          isLogin(false);
          isSuccess(json["message"].toString());
        }
        mobile.clear();
        password.clear();
      });
    } on ErrorHandler catch (ex) {
      if (ex.message.toString() == "Internet Connection Failure") {}
    }
  }

  Future signUpLogin() async {
    try {
      var headers = {
        "Content-Type": "application/json",
        "Accept": "application/json"
      };
      await ApiHandler.postRequest(
        UrlResources.SignUp_user,
        body: jsonEncode(
          UserSignupData(
            mobile: mobile.text.toString(),
            email: email.text.toString(),
            confirmPassword: confirmPassword.text.toString(),
            name: name.text.toString(),
            password: password.text.toString(),
            role: role,
          ).toJson(),
        ),
        headers: headers,
      ).then((json) async {
        if (json["user"] == "isSuccess") {
          isLogin(true);
          isSuccess(json["message"].toString());
          var name = json["user"]["name"].toString();
          var email = json["user"]["email"].toString();
          var mobile = json["user"]["mobile"].toString();
          var password = json["user"]["password"].toString();
          var confirmPass = json["user"]["confirm_password"].toString();
          var role = json["user"]["role"].toString();

          SharedPreferences prefs = await SharedPreferences.getInstance();
          prefs.setString("isLogin", "yes");

          prefs.setString("name", name);
          prefs.setString("email", email);
          prefs.setString("mobile", mobile);
          prefs.setString("password", password);
          prefs.setString("confirm_password", confirmPass);
          prefs.setString("role", role);
          await sendOtp();
        } else {
          isLogin(false);
          isSuccess(json["message"].toString());
        }
      });
    } on ErrorHandler catch (ex) {
      if (ex.message.toString() == "Internet Connection Failure") {}
    }
  }

  sendOtp() async {
    try {
      var headers = {
        "Content-Type": "application/json",
        "Accept": "application/json"
      };
      print(
          jsonEncode(UserSignupData(mobile: mobile.text.toString()).toJson()));
      await ApiHandler.postRequest(
        UrlResources.Send_Otp,
        body: jsonEncode(
          UserSignupData(
            mobile: mobile.text.toString(),
          ).toJson(),
        ),
        headers: headers,
      ).then((json) async {
        if (json["user"] == "isSuccess") {
          isLogin(true);
          isSuccess(json["message"].toString());
          // Get.to(sendOtp());
        } else {
          isLogin(false);
          isSuccess(json["message"].toString());
        }
      });
    } on ErrorHandler catch (ex) {
      if (ex.message.toString() == "Internet Connection Failure") {}
    }
  }

  // verifyOtp () async {
  //   try {
  //     var headers = {
  //       "Content-Type": "application/json",
  //       "Accept": "application/json"
  //     };
  //
  //     await ApiHandler.postRequest(UrlResources.verify_otp,body:jsonEncode(
  //         VerifyOtp(
  //           mobile: mobile.text.toString(),
  //           hashCode: hashCode.toString(),
  //           otp: otp.toString(),
  //         ).toJson(),
  //       ),
  //       headers: headers,
  //     ).then((json) async {
  //       if (json["isSuccess"] == true) {
  //         isLogin(true);
  //         isSuccess(json["message"].toString());
  //       } else {
  //         isLogin(false);
  //         isSuccess(json["message"].toString());
  //       }
  //     });
  //   }
  //   on ErrorHandler catch (ex) {
  //     if (ex.message.toString() == "Internet Connection Failure") {
  //     } else if (ex.message.toString() == "Bad Response Format") {
  //     }
  //   }
  // }

  forgotPassword() async {
    try {
      var headers = {
        "Content-Type": "application/json",
        "Accept": "application/json"
      };
      await ApiHandler.postRequest(
        UrlResources.reset_password,
        body: jsonEncode(
          UserSignupData(
            mobile: mobile.text.toString(),
          ).toJson(),
        ),
        headers: headers,
      ).then((json) async {
        if (json["user"] == "isSuccess") {
          isLogin(true);
          isSuccess(json["message"].toString());
        } else {
          isLogin(false);
          isSuccess(json["message"].toString());
        }
      });
    } on ErrorHandler catch (ex) {
      if (ex.message.toString() == "Internet Connection Failure") {}
    }
  }


  UserList userModel = UserList();

  getAllUser() async {
    try {
      var header = {
        'Authorization':
        'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6OCwiaWF0IjoxNzA4NDk2Mzc1LCJleHAiOjE3MDkxMDExNzV9.b2mkldeEzvrUnlVc1ixn_qu5txCuV1Zak3QOgP4uGFs'
      };
      await ApiHandler.getRequest(UrlResources.get_user, header).then((json) {
        userModel = UserList.fromJson(jsonDecode(json)["payload"]);
        // print(userModel);
      });
    } on ErrorHandler catch (ex) {
      if (ex.message.toString() == "Internet Connection Failure") {}
    }
  }

  @override
  void onInit() {
    super.onInit();
    getAllUser();
  }


  ExperienceResponseModel allExperience = ExperienceResponseModel();

  void getExperience() async {
    try {
      var headers = {
        'Authorization':
        'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MzIsImlhdCI6MTcwODYwMDc5NSwiZXhwIjoxNzA5MjA1NTk1fQ.Sj6AfMuK6nUde94MkeTQpT2Zmg0TUa73nmer5_JGKc0'
      };
      var data = await ApiHandler.experienceData(
          UrlResources.get_Experience, headers);
      print(data);
      allExperience = data;
    } on ErrorHandler catch (ex) {
      if (ex.message == "Bad Response Format") {}
    }
  }


  ExperienceModel getMainExperience = ExperienceModel();

  void getAllExperience() async {
    try {
      var headers = {
        'Authorization':
        'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6MzIsImlhdCI6MTcwODYwMDc5NSwiZXhwIjoxNzA5MjA1NTk1fQ.Sj6AfMuK6nUde94MkeTQpT2Zmg0TUa73nmer5_JGKc0'
      };
      var data = await ApiHandler.experienceMainData(UrlResources.getall_Experience,headers);
      print(data);
      getMainExperience = data;
    } on ErrorHandler catch (ex) {
      if (ex.message == "Bad Response Format") {}
    }
  }


  RxBool isinsert=false.obs;
  RxString message="".obs;
  insertUSer() async {
    var params =
    {
      "title":title.text.toString(),
      "company":company.text.toString(),
      "startdate":startDate.text.toString(),
      "enddate":endDate.text.toString(),
      "description":description.text.toString(),
    };
    var headers = {
      'Authorization': 'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6OCwiaWF0IjoxNzA4MzYwNDA1LCJleHAiOjE3MDg5NjUyMDV9.PprfBPqBTjFIe_B8DMh9I-a-rx-PJIh1Cg2pwL9oUFI'
    };
    try
    {
      await ApiHandler.postRequest(UrlResources.add_Experience,body: params,headers: headers).then((json){
        if(json["isSuccess"]=="true")
        {
          message(json["message"].toString());
          isinsert(true);
          Get.to(HomeView());
        }
        else
        {
          message(json["message"].toString());
          isinsert(false);
        }
      });
    }
    on ErrorHandler catch (ex)
    {
      if(ex.message.toString()=="Internet Connection Failure"){
      }

    }
  }
}
