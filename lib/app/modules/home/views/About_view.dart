import 'package:apiproject_getx/app/modules/home/controllers/auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AboutView extends StatefulWidget {
  const AboutView({super.key});

  @override
  State<AboutView> createState() => _AboutViewState();
}

 class _AboutViewState extends State<AboutView> {
  @override
  Widget build(BuildContext context) {
    authController authObj = Get.put(authController());
    return Scaffold(
      body: Column(
        // crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text("Name :" +authObj.userModel.name.toString()),
          Text("Email :" +authObj.userModel.email.toString()),
          Text("Mobile :" +authObj.userModel.mobile.toString()),
          Text("City :" +authObj.userModel.city.toString()),
          Text("Role :" +authObj.userModel.role.toString()),
          Text("Headline :"+ authObj.userModel.headline.toString()),
          Text("dob :"+ authObj.userModel.birthdate.toString()),
          Text("Education :"+ authObj.userModel.education.toString()),
          Text("Location :"+ authObj.userModel.location.toString()),
          Text("skills :"+ authObj.userModel.skills.toString()),
          Text("university :"+ authObj.userModel.university.toString())

        ],
      ),
    );
  }
}
