import 'package:apiproject_getx/app/modules/home/controllers/auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TestimonialView extends StatefulWidget {
  const TestimonialView({super.key});

  @override
  State<TestimonialView> createState() => _TestimonialViewState();
}

class _TestimonialViewState extends State<TestimonialView> {

  authController authObj = Get.put(authController());


  void initState() {
    super.initState();
    authObj.allTestimonial;
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body:(authObj.allTestimonial==null)?Center(child: CircularProgressIndicator()):ListView.builder(
          itemCount: authObj.allTestimonial.payload!.length,
              itemBuilder: (BuildContext context,int index)
          {
            return Column(
              children: [
                Row(
                  children: [
                    CircleAvatar(
                      radius: 30,
                      backgroundImage: NetworkImage(authObj.allTestimonial.payload![index].image.toString()),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                              Row(
                                children: [
                                  Text(authObj.allTestimonial.payload![index].name.toString()),
                                  Spacer(),
                                  Column(
                                    children: [
                                      Container(
                                        height: 40,
                                        width: 40,
                                        color: Colors.black,
                                        child: IconButton(
                                          icon: Icon(Icons.edit,color: Colors.white,),
                                          onPressed: (){
                                            Get.bottomSheet(
                                              Container(
                                                  height: 150,
                                                  color: Colors.greenAccent,
                                                  child:Column(
                                                    children: [

                                                    ],
                                                  )
                                              ),
                                              barrierColor: Colors.red[50],
                                              isDismissible: false,
                                            );

                                          },
                                        ),
                                      ),
                                      SizedBox(height: 5,),
                                      Container(
                                        height: 40,
                                        width: 40,
                                        color: Colors.black,
                                        child: IconButton(
                                          icon: Icon(Icons.delete,color: Colors.white,),
                                          onPressed: (){

                                          },
                                        ),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            Text(authObj.allTestimonial.payload![index].position.toString()),
                            Text(authObj.allTestimonial.payload![index].projectTitle.toString())
                          ],
                        ),
                      ),
                    )
                  ],
                ),
                Text(authObj.allTestimonial.payload![index].projectDescription.toString()),
              ],
            );
          }
      )
    );
  }
}
