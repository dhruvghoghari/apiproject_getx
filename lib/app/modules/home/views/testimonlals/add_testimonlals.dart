import 'dart:io';
import 'package:apiproject_getx/app/modules/home/controllers/auth_controller.dart';
import 'package:apiproject_getx/app/widgets/authbutton.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import '../../../../utils/theme.dart';

class AddTestimonial extends StatefulWidget {
  const AddTestimonial({super.key});
  @override
  State<AddTestimonial> createState() => _AddTestimonialState();
}

class _AddTestimonialState extends State<AddTestimonial> {
  authController authObj = Get.put(authController());

  String profileUrl = '';
  final ImagePicker picker = ImagePicker();

  void updateProfileUrl(String newUrl) {
    profileUrl = newUrl;
  }

  final addKey = GlobalKey<FormState>();

  DateTime? selectedDate;

  Future<void> _selectedDate(BuildContext context) async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (pickedDate != null) {
      String formattedDate = DateFormat("dd-MM-yyyy").format(pickedDate);
      setState(() {
        selectedDate = pickedDate;
        authObj.startDate.text = formattedDate.toString();
      });
    }
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Stack(
                children: [
                  profileUrl.isEmpty ?
                  Container(
                      width: 150,
                      height: 150,
                      decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(image: AssetImage("assets/Img/Nature.jpg"),fit: BoxFit.cover)))
                      : Container(
                      width: 150,
                      height: 150,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(image: FileImage(File(profileUrl)),fit: BoxFit.cover))),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: Row(
                      children: [
                        IconButton(
                          icon: const Icon(Icons.photo_library),
                          onPressed: () async {
                            final XFile? image = await picker.pickImage(source: ImageSource.gallery);
                            if (image != null)
                            {
                              setState(() {
                                updateProfileUrl(image.path);
                              });
                            }
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Form(
                key: addKey,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        controller:authObj.TestiName,
                        keyboardType: TextInputType.text,
                        decoration: AppTheme.customDecoration("name"),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        controller: authObj.projectTitle,
                        keyboardType: TextInputType.text,
                        decoration: AppTheme.customDecoration("ProjectTitle"),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        controller: authObj.projectDescription,
                        keyboardType: TextInputType.text,
                        decoration: AppTheme.customDecoration("ProjectDescription"),
                        onTap: () async {
                          await _selectedDate(context);
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        controller: authObj.position,
                        keyboardType: TextInputType.text,
                        decoration: AppTheme.customDecoration("position"),
                      ),
                    ),
                    SizedBox(height: 30),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        authBtn(
                          btnText: "Save",
                          onClick: () async{
                            // if (addKey.currentState?.validate() ?? false) {
                            //   AppTheme.customToast("Add required Field");
                            // }
                          },
                        ),
                        authBtn(btnText: "Cancel",
                            onClick: (){
                              Get.back();
                            }
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
