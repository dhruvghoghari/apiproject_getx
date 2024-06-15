import 'package:apiproject_getx/app/modules/home/controllers/auth_controller.dart';
import 'package:apiproject_getx/app/modules/home/views/experience/update_experience.dart';
import 'package:apiproject_getx/app/utils/theme.dart';
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
      body:ListView.builder(
        itemCount: authObj.allExperience.payload!.length,
          itemBuilder: (BuildContext context ,int index)
          {
            return Column(
              children: [
                Row(
                  children: [
                    CircleAvatar(
                      radius: 30,
                      backgroundImage: NetworkImage(authObj.allExperience.payload![index].image.toString()),
                    ),
                   Expanded(
                     child: Padding(
                       padding: const EdgeInsets.all(20.0),
                       child: Column(
                         crossAxisAlignment: CrossAxisAlignment.start,
                         children: [
                           Text(authObj.allExperience.payload![index].title.toString()),
                           Row(
                             children: [
                               Text(authObj.allExperience.payload![index].company.toString()),
                              Spacer(),
                              Container(
                                height: 40,
                                width: 40,
                                color: Colors.black,
                                child: IconButton(
                                  icon: Icon(Icons.edit,color: Colors.white,),
                                  onPressed: (){
                                    // Get.to(UpdateExperience());
                                    AppTheme.customBottomSheet();
                                  },
                                ),
                              )
                             ],
                           ),
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
