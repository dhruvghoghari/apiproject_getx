import 'package:apiproject_getx/app/modules/home/views/otp_view.dart';
import 'package:apiproject_getx/app/utils/validation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../utils/theme.dart';
import '../../../widgets/authbutton.dart';
import '../controllers/auth_controller.dart';
import 'login_view.dart';

class SignupView extends StatefulWidget {
  const SignupView({Key? key}) : super(key: key);
  @override
  State<SignupView> createState() => _SignupViewState();
}
class _SignupViewState extends State<SignupView> {
  String userDepartment="Company";
  @override
  Widget build(BuildContext context) {
    authController authObj = Get.put(authController());
    return Scaffold(
      appBar: AppBar(title: Text("Sign Up"),),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Obx(() => Form(
              // key: authObj.signUpKey,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: TextFormField(
                      controller: authObj.name,
                      keyboardType: TextInputType.name,
                      decoration: AppTheme.customDecoration("Name", label: "Name"),
                       //validator:Validation.customNameValidation
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: TextFormField(
                      controller: authObj.mobile,
                      keyboardType: TextInputType.number,
                      decoration: AppTheme.customDecoration("0123456789",label: "Mobile"),
                       //validator: authObj.customNumberValidation
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: TextFormField(
                      controller: authObj.email,
                      keyboardType: TextInputType.emailAddress,
                      decoration: AppTheme.customDecoration("Enter email address",label: "Email Address",),
                       //validator: authObj.customEmailValidation
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
                       //validator: authObj.customPasswordValidation,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: TextFormField(
                      controller: authObj.confirmPassword,
                      obscureText: authObj.passwordVisible.value,
                      decoration: AppTheme.customDecoration("confirm password",label: "Confirm Password",
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
                       //validator: authObj.customConfirmPasswordValidation,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: DropdownButtonFormField<String>(
                      value:userDepartment,
                      onChanged: (String? newValue) {
                        if (newValue != null) {
                          authObj.role = newValue;
                        }
                      },
                      items: <String>['', 'Agency', 'Broker', 'Developers', 'Company']
                          .map((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(
                            value.isNotEmpty ? value : 'Select Type',
                            style: const TextStyle(color: Colors.grey),
                          ),
                        );
                      }).toList(),
                      decoration: AppTheme.customDecoration("Select Type"),
                      // validator: authObj.customRoleValidation
                    ),
                  ),
                  SizedBox(height: 20.0),
                  authBtn(
                      onClick: () async{
                        // if (authObj.signUpKey.currentState?.validate() ?? false) {}
                        await authObj.signUpLogin().then((value) {
                          if(authObj.isLogin==true)
                          {
                            AppTheme.customSnackBar(authObj);
                          }
                          else
                          {
                            AppTheme.customSnackBar(authObj);
                          }

                          authObj.name.clear();
                          authObj.mobile.clear();
                          authObj.email.clear();
                          authObj.password.clear();
                          authObj.confirmPassword.clear();
                          userDepartment="";
                          Get.to(OtpView());

                        });



                      },btnText: "SignUp"),
                  SizedBox(height: 20.0),
                  RichText(
                    text: TextSpan(
                      text: 'Already Have Account?',
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 16,
                      ),
                      children: <TextSpan>[
                        TextSpan(
                          text: 'Login',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            fontWeight: FontWeight.bold
                          ),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              Get.to(loginView());
                            },
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 20),
                ],
              ),
            ),)
          ],
        ),
      ),
    );
  }
}
