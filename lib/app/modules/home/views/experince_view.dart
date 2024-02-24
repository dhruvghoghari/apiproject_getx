import 'package:apiproject_getx/app/modules/home/controllers/auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class ExperienceView extends StatefulWidget {
  const ExperienceView({super.key});

  @override
  State<ExperienceView> createState() => _ExperienceViewState();
}

class _ExperienceViewState extends State<ExperienceView> {
  authController authObj = Get.put(authController());


  void initState() {
    super.initState();
     authObj.getExperience();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body:(authObj.allExperience==null)?Center(child: CircularProgressIndicator()):ListView.builder(
        itemCount: authObj.allExperience.payload!.length,
          itemBuilder: (BuildContext context ,int index)
          {
            return Column(
              children: [
                Row(
                  children: [
                    CircleAvatar(
                      radius: 30,
                      foregroundImage: NetworkImage(authObj.allExperience.payload![index].image!),
                    ),
                   Expanded(
                     child: Padding(
                       padding: const EdgeInsets.all(20.0),
                       child: Column(
                         crossAxisAlignment: CrossAxisAlignment.start,
                         children: [
                           Text(authObj.allExperience.payload![index].title.toString()),
                           Text(authObj.allExperience.payload![index].company.toString()),
                           Text(authObj.allExperience.payload![index].startDate! +  " - "  +authObj.allExperience.payload![index].endDate.toString()),
                         ],
                       ),
                     ),
                   ),
                  ],
                ),
                Row(
                  children: [
                    Text(authObj.allExperience.payload![index].description.toString())
                  ],
                )
              ],
            );
          }
      )
    );
  }
}
