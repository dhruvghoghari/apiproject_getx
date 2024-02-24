import 'package:apiproject_getx/app/modules/home/views/home_view.dart';
import 'package:apiproject_getx/app/modules/home/views/login_view.dart';
import 'package:apiproject_getx/app/widgets/authbutton.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import '../../../utils/theme.dart';
import '../controllers/auth_controller.dart';

class OtpView extends StatefulWidget {
  const OtpView({Key? key}) : super(key: key);

  @override
  State<OtpView> createState() => _OtpViewState();
}
class _OtpViewState extends State<OtpView> {
  TextEditingController textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    authController authObj = Get.put(authController());
    return Scaffold(
      appBar: AppBar(
        title: Text("otpView"),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(40.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Text("Verify Your Account",style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 30
                ),),
                Image.asset("assets/Gif/otp-verification.gif"),
                Text("A 6-digit PIN has been sent to your email. Enter the 6 numbers below to continue",textAlign: TextAlign.center,style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.w300
                ),),
                Form(
                  // key: authObj.otpKey,
                  child: PinCodeTextField(
                    appContext: context,
                    length: 6,
                    onChanged: (value) {},
                    controller: textEditingController,
                    keyboardType: TextInputType.number,
                    onCompleted: (value) {
                      // Handle OTP completion
                    },
                    pinTheme: PinTheme(
                      shape: PinCodeFieldShape.circle,
                      activeColor: Colors.grey,
                      inactiveColor: Colors.grey,
                      selectedColor: Colors.black,
                    ),
                  ),
                ),
                SizedBox(height: 20),
               authBtn(onClick: () async{
                 // await authObj.verifyOtp();
                 if(authObj.isLogin==true)
                 {
                   AppTheme.customSnackBar(authObj);
                   Get.to(HomeView());
                 }
                 else
                 {
                   AppTheme.customSnackBar(authObj);
                 }
                 Get.to(loginView());
               },btnText: "Verify")
              ],
            ),
          ),
        ),
      ),
    );
  }
}
