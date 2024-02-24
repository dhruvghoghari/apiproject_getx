import 'package:apiproject_getx/app/modules/home/views/forgot_view.dart';
import 'package:apiproject_getx/app/modules/home/views/home_view.dart';
import 'package:apiproject_getx/app/modules/home/views/signup_view.dart';
import 'package:apiproject_getx/app/widgets/authbutton.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../utils/theme.dart';
import '../controllers/auth_controller.dart';

class loginView extends GetView<authController> {
  @override
  Widget build(BuildContext context) {
    authController authObj = Get.put(authController());
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Column(
          children: [
            Form(
              key: authObj.signInKey,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: TextFormField(
                      controller: authObj.mobile,
                      keyboardType: TextInputType.number,
                      decoration: AppTheme.customDecoration("Enter Mobile",label: "Mobile"),
                       //validator: Validation.cu
                    ),
                  ),
                  Obx(() =>Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: TextFormField(
                      controller: authObj.password,
                      obscureText: authObj.passwordVisible.value,
                      decoration: AppTheme.customDecoration("Enter password",label: "Password",
                      ).copyWith(
                        suffixIcon: InkWell(
                          onTap: () {
                            authObj.passwordVisibility();
                          },
                          child: Icon(
                            authObj.passwordVisible.value
                                ? Icons.visibility_outlined
                                : Icons.visibility_off_outlined,
                            color: Colors.grey,
                          ),
                        ),
                      ),
                      // validator: Validation.customPasswordValidation,
                    ),
                  )),
                  Row(
                    children: [
                      SizedBox(width: 20),
                      GestureDetector(onTap: (){
                        // Get.to(ForgotPassword());
                      },child: Text("Forgot Password")),
                    ],
                  ),
                  SizedBox(height: 20),
                  authBtn( onClick: () async{
                    if (authObj.signInKey.currentState?.validate() ?? false) {}
                    await authObj.userLogin();
                    if(authObj.isLogin==true)
                    {
                      AppTheme.customSnackBar(authObj);
                    }
                    else
                    {
                      AppTheme.customSnackBar(authObj);
                    }
                    Get.to(HomeView());

                  },btnText:"Login"),
                  SizedBox(height: 20),
                  RichText(
                    text: TextSpan(
                      text: 'Not Have Account?',
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 16,
                      ),
                      children: <TextSpan>[
                        TextSpan(
                          text: 'Sign up',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            fontWeight: FontWeight.w500
                          ),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              Get.to(SignupView());
                            },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      )
    );
  }
}
