// import 'package:apiproject_getx/app/widgets/authbutton.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:get/get_core/src/get_main.dart';
// import '../../../utils/theme.dart';
// import '../controllers/auth_controller.dart';
//
// class ForgotPassword extends StatefulWidget {
//   const ForgotPassword({super.key});
//
//   @override
//   State<ForgotPassword> createState() => _ForgotPasswordState();
// }
//
// class _ForgotPasswordState extends State<ForgotPassword> {
//   @override
//   Widget build(BuildContext context) {
//     authController authObj = Get.put(authController());
//     return Scaffold(
//       appBar: AppBar(title: Text("ForgotPassword"),),
//       body: SafeArea(
//         child: Center(
//           child: Column(
//             children: [
//               Text("Enter your mobile Number Get otp",
//                 textAlign: TextAlign.center,),
//               SizedBox(height: 10.0),
//               Form(
//                 key: authObj.forgotKey,
//                 child: Padding(
//                   padding: const EdgeInsets.all(30.0),
//                   child: TextFormField(
//                     controller: authObj.mobile,
//                     keyboardType: TextInputType.number,
//                     decoration: AppTheme.customDecoration("Enter Mobile",label: "Mobile"),
//                     // validator: Validation.customNumberValidation
//                   ),
//                 ),
//               ),
//               authBtn( onClick: () async{
//                 if (authObj.forgotKey.currentState?.validate() ?? false) {}
//                 await authObj.userLogin();
//                 if(authObj.isLogin==true)
//                 {
//                   AppTheme.customSnackBar(authObj);
//                 }
//                 else
//                 {
//                   AppTheme.customSnackBar(authObj);
//                 }
//
//
//               },btnText:"Reset Password",)
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
