import 'package:apiproject_getx/app/modules/home/views/sign_up.dart';
import 'package:apiproject_getx/app/widgets/submit_button.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../utils/theme.dart';
import '../controllers/auth_controller.dart';
import 'package:http/http.dart' as http;

class LoginView extends GetView<AuthController> {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    AuthController authObj = Get.put(AuthController());
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
        centerTitle: true,
      ),
      body:Obx(() => Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Form(
            key: authObj.loginKey,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: TextFormField(
                      controller: authObj.email,
                      keyboardType: TextInputType.emailAddress,
                      decoration: AppTheme.customDecoration("Enter email address",label: "Email Address",),
                      // validator: authObj.customEmailValidation
                  ),
                ),
                Padding(
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
                    validator: authObj.customPasswordValidation,
                  ),
                ),
                Row(
                  children: [
                    SizedBox(width: 20.0),
                    Text("Forgot Passsord")
                  ],
                ),
                SizedBox(height: 20.0),
                submitBtn(
                    onClick: () async{
                      if (authObj.loginKey.currentState?.validate() ?? false) {}
                      authObj.email.text.toString();
                      authObj.password.text.toString();
                      await authObj.userLogin();

                      if(authObj.isLogin==true)
                      {
                        var snackbar = SnackBar(content: Text(authObj.isSuccess.toString()));
                        ScaffoldMessenger.of(context).showSnackBar(snackbar);
                        // Get.snackbar('Title',
                        //   authObj.loginMessage.toString(),
                        //   snackPosition: SnackPosition.BOTTOM,
                        //   colorText: Colors.green
                        // );
                      }
                      else
                      {
                        var snackbar = SnackBar(content: Text(authObj.isSuccess.toString()));
                        ScaffoldMessenger.of(context).showSnackBar(snackbar);
                        // Get.snackbar('Title',
                        //     authObj.loginMessage.toString(),
                        //     snackPosition: SnackPosition.BOTTOM,
                        //     colorText: Colors.red
                        // );
                      }
                    },btnText: "Login"),
                SizedBox(height: 20.0),
                RichText(
                  text: TextSpan(
                    text: 'Not Have Account?',
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 16,
                    ),
                    children: <TextSpan>[
                      TextSpan(
                        text: ' Sign Up',
                        style: TextStyle(
                          color: Colors.black,
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
      ))
    );
  }
}
