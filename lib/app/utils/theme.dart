import 'package:apiproject_getx/app/modules/home/controllers/auth_controller.dart';
import 'package:apiproject_getx/app/widgets/authbutton.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class AppTheme {
  authController authObj = Get.put(authController());
  static const loginBtnColor = Colors.black;
  static const borderColor = Colors.grey;


  static InputDecoration customDecoration(String hintText, {String? label}) {
    return InputDecoration(
      labelText: label,
      alignLabelWithHint: true,
      labelStyle: const TextStyle(
          fontSize: 18, fontWeight: FontWeight.w500, color: Colors.grey),
      hintText: hintText,
      fillColor: Colors.white,
      contentPadding: const EdgeInsets.symmetric(
          vertical: 25.0, horizontal: 16.0),
      border: const OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(25)),
        gapPadding: 10,
        borderSide: BorderSide(color: borderColor, width: 2),
      ),
      disabledBorder: const OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(25)),
        gapPadding: 10,
        borderSide: BorderSide(color: borderColor, width: 2),
      ),
      enabledBorder: const OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(25)),
        gapPadding: 10,
        borderSide: BorderSide(color: borderColor, width: 2),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(25.0),
        borderSide: const BorderSide(color: loginBtnColor, width: 2),
      ),
      hintStyle: const TextStyle(color: Colors.grey),
    );
  }

  static customSnackBar(authController authObj) {
    return Get.snackbar(
      "User Login",
      authObj.isSuccess.toString(),
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: Colors.black,
      colorText: Colors.white,
      duration: Duration(seconds: 3),
      isDismissible: true,
    );
  }

  static InputDecoration homeDecoration() {
    return InputDecoration(
      border: OutlineInputBorder(
        borderSide: BorderSide(
          color: Colors.grey,
        ),
        borderRadius: BorderRadius.circular(30),
      ),
    );
  }

  static customToast(String message) {
    Get.snackbar('Toast',
      message,
      backgroundColor: Colors.black,
      colorText: Colors.white,
      snackPosition: SnackPosition.BOTTOM,
      duration: Duration(seconds: 3),
    );
  }

  static customBottomSheet() {
    TextEditingController name = TextEditingController();
    return Get.bottomSheet(
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0)
      ),
      Container(
        padding: EdgeInsets.all(15.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: name,
              decoration: InputDecoration(
                hintText: 'Enter your text',
              ),
            ),
           Row(
             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
             children: [
               authBtn(onClick: (){

               },btnText: "Submit",),

               authBtn(onClick: (){
                 Get.back();
               },btnText: "Cancel",)
             ],
           ),
          ],
        ),
      ),
    );
  }



}
