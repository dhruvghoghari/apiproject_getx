import 'package:apiproject_getx/app/modules/home/views/login_view.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../utils/theme.dart';
import '../../../widgets/submit_button.dart';
import '../controllers/auth_controller.dart';

class SignupView extends StatefulWidget {
  const SignupView({Key? key}) : super(key: key);

  @override
  State<SignupView> createState() => _SignupViewState();
}
class _SignupViewState extends State<SignupView> {
  @override
  Widget build(BuildContext context) {
    AuthController authObj = Get.put(AuthController());
    return Scaffold(
      appBar: AppBar(title: Text("Sign Up"),),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Form(
              key: authObj.signupKey,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: TextFormField(
                      keyboardType: TextInputType.name,
                      decoration: AppTheme.customDecoration("Name", label: "Name"),
                      validator: authObj.customNameValidation
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: TextFormField(
                        controller: authObj.mobile,
                        keyboardType: TextInputType.number,
                        decoration: AppTheme.customDecoration("0123456789",label: "Mobile"),
                        validator: authObj.customNumberValidation
                    ),
                  ),
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
                      validator: authObj.customConfirmPasswordValidation,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: DropdownButtonFormField<String>(
                      value: authObj.userDepartment.value,
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
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please select a Type';
                        }
                        return null;
                      },
                    ),
                  ),
                  SizedBox(height: 20.0),
                  submitBtn(
                      onClick: () async{
                        if (authObj.signupKey.currentState?.validate() ?? false) {}
                        authObj.singupLogin();
                        await authObj.singupLogin();

                        if(authObj.isLogin==true)
                        {
                          var snackbar = SnackBar(content: Text(authObj.isSuccess.toString()));
                          ScaffoldMessenger.of(context).showSnackBar(snackbar);
                        }
                        else
                        {
                          var snackbar = SnackBar(content: Text(authObj.isSuccess.toString()));
                          ScaffoldMessenger.of(context).showSnackBar(snackbar);
                        }

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
                          ),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                            Get.to(LoginView());
                            },
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 20),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
