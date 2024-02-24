import 'package:apiproject_getx/app/modules/home/views/About_view.dart';
import 'package:apiproject_getx/app/modules/home/views/experince_view.dart';
import 'package:apiproject_getx/app/modules/home/views/posts_view.dart';
import 'package:apiproject_getx/app/utils/string.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:apiproject_getx/app/modules/home/controllers/auth_controller.dart';

import 'add_experince_view.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  authController authObj = Get.put(authController());
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.black,
          child: Icon(Icons.add,color: Colors.white,),
          onPressed: (){
            Get.to(AddExperience());
          },
        ),
        body:SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
                children: [
                  Row(
                    children: [
                      Container(
                          width: 50,
                          height: 50,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              image: DecorationImage(image: AssetImage("assets/Img/Nature.jpg"),fit: BoxFit.cover))
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: Colors.grey,
                              ),
                              borderRadius: BorderRadius.circular(30),
                              color: Colors.grey[200],
                            ),
                            child: TextField(
                              controller: authObj.search,
                              keyboardType: TextInputType.text,
                              decoration: InputDecoration(
                                hintText: 'Search',
                                border: InputBorder.none,
                                contentPadding: EdgeInsets.symmetric(vertical: 8,horizontal: 15)
                              ),
                            ),
                          ),
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                        },
                        icon: Icon(Icons.wechat_sharp,size: 45),
                      )
                    ],
                  ),
                  SizedBox(height: 20,),
                  Stack(
                    children: [
                      Container(
                        height: 150,
                        width: 150,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                            image: AssetImage("assets/Img/Nature.jpg"),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: 0,
                        left: 0,
                        right: 0,
                        child: Container(
                          height: 30,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(80),
                              bottomRight: Radius.circular(75),
                            ),
                          ),
                          child:Image.asset("assets/Img/true-choice-png.webp")
                        ),
                      ),
                    ],
                  ),
                  Text(homeName,style: TextStyle(
                    fontSize: 30
                  ),),
                  Text(homeText,textAlign: TextAlign.center,),

                  Container(
                    child: TabBar(
                      labelColor: Colors.black,
                      indicatorColor: Colors.black,
                      unselectedLabelColor: Colors.grey,
                      tabs: [
                        Tab(text: "Posts"),
                        Tab(text: "About"),
                        Tab(text: "Experience"),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Container(
                      child: TabBarView(
                        children: [
                          Container(
                            child: Posts(),
                          ),
                          Container(
                            child: AboutView(),
                          ),
                          Container(
                            child: ExperienceView(),
                          )
                        ],
                      ),
                    ),
                  )
                ]
            ),
          ),
        ),
      ),
    );
  }
}

