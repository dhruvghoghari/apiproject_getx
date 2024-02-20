import 'dart:convert';
import 'package:apiproject_getx/app/models/usersignupdata.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import '../../../helpers/ApiHandler.dart';
import '../../../helpers/ErrorHandler.dart';
import '../../../models/loginresponsemodel.dart';
import '../../../resources/UrlResources.dart';

class AuthController extends GetxController {

  TextEditingController name = TextEditingController();
  TextEditingController mobile = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController confirmPassword = TextEditingController();
  String role ='';


  final loginKey = GlobalKey<FormState>();  // login Form
  final signupKey = GlobalKey<FormState>();  // signUp Form



  RxBool passwordVisible = true.obs;       // Password Visibility
  void passwordVisibility() {
    passwordVisible.value = !passwordVisible.value;
  }


  bool isNumeric(String? value) {           // mobile
    if (value == null) {
      return false;
    }
    return double.tryParse(value) != null;
  }

  RxString userDepartment="Company".obs;



  RxBool isLogin = false.obs;
  RxString isSuccess = "".obs;
  userLogin () async {
    try
    {
      var headers={
        "Content-Type":"application/json",
        "Accept": "application/json"
      };
      var params={
        "mobile":email.text.toString(),
        "password":password.text.toString(),
        // "token":"eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6OCwiaWF0IjoxNzA4MzU4MDE0LCJleHAiOjE3MDg5NjI4MTR9.RGwDrV0DxCBofup5un3jGHyOSCv-r28c_FR2joHED7Y",
      };

      await ApiHandler.postRequest(UrlResources.userLogin,body:jsonEncode(Userinputlogin(mobile:email.text.toString(),password:password.text.toString()).toJson()),headers: headers).then((json) async {
        if(json["user"]=="isSuccess")
        {
          isLogin(true);
          isSuccess(json["message"].toString());
          var id = json["user"]["id"].toString();
          var email = json["user"]["email"].toString();
          var password = json["user"]["password"].toString();
          var token = json["user"]["token"].toString();
        }
        else
        {
          isLogin(false);
          isSuccess(json["message"].toString());
        }
      });

    }
    on ErrorHandler catch (ex)
    {
      if(ex.message.toString()=="Internet Connection Failure")
      {
        //redirect to no internet page
      }
      else if(ex.message.toString()=="Bad Response Format")
      {
        //redirect to support page
      }
    }
    email.clear();
    password.clear();
  }


  singupLogin () async {
    try
    {
      var headers={
        "Content-Type":"application/json",
        "Accept": "application/json"
      };

      await ApiHandler.postRequest(UrlResources.usersignupin,body:jsonEncode(
          Usersignupdata(
              mobile: mobile.text.toString(),
            email: email.text.toString(),
            confirmPassword: confirmPassword.text.toString(),
            name: name.text.toString(),
            password: password.text.toString(),
            role: role
          ).toJson()),headers: headers).then((json) async {
        if(json["user"]=="isSuccess")
        {
          isLogin(true);
          isSuccess(json["message"].toString());
          // var id = json["user"]["id"].toString();
          // var email = json["user"]["email"].toString();
          // var password = json["user"]["password"].toString();
          // var token = json["user"]["token"].toString();
        }
        else
        {
          isLogin(false);
          isSuccess(json["message"].toString());
        }
      });

    }
    on ErrorHandler catch (ex)
    {
      if(ex.message.toString()=="Internet Connection Failure")
      {
        //redirect to no internet page
      }
      else if(ex.message.toString()=="Bad Response Format")
      {
        //redirect to support page
      }
    }
  }



  String? customNameValidation(String? value)
  {
    if (value!.isEmpty) {
      return 'Please enter your name';
    }
    return null;
  }

  String? customNumberValidation(String? value) {
    {
      if (value == null || value.isEmpty)
      {
        return 'Please enter a mobile number';
      }
      else if (value.length != 10 ||!isNumeric(value))
      {
        return 'Please enter a valid 10-digit mobile number';
      }
      return null;
    }
  }

  //
  // String? customEmailValidation(String? value) {
  //   if (value == null || value.isEmpty) {
  //     return 'Please enter your email';
  //   }
  //   else if (!RegExp(
  //       r"^[a-zA-Z0-9.a-zA-Z0-9!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$")
  //       .hasMatch(value)) {
  //     return 'Please enter a valid email address';
  //   }
  //   return null;
  // }

  String? customPasswordValidation(String? value){
    if (value == null || value.isEmpty)
    {
      return 'Please enter a password';
    }
    else if (value.length < 7)
    {
      return 'Password must be at least 10 characters long';
    }
    // else if (!RegExp(r'^(?=.*[a-zA-Z])(?=.*\d)').hasMatch(value))
    // {
    //   return 'Password must contain both letters and numbers';
    // }
    return null;
  }

  String? customConfirmPasswordValidation(String? value){
    if (value == null || value.isEmpty)
    {
      return 'Please enter a password';
    }
    else if (value.length < 10)
    {
      return 'Password must be at least 10 characters long';
    }
    else if (!RegExp(r'^(?=.*[a-zA-Z])(?=.*\d)').hasMatch(value))
    {
      return 'Password must contain both letters and numbers';
    }
    return null;
  }


}
