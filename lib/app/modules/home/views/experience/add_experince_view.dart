import 'dart:io';
import 'package:apiproject_getx/app/modules/home/controllers/auth_controller.dart';
import 'package:apiproject_getx/app/widgets/authbutton.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import '../../../../utils/theme.dart';

class AddExperience extends StatefulWidget {
  const AddExperience({super.key});
  @override
  State<AddExperience> createState() => _AddExperienceState();
}

class _AddExperienceState extends State<AddExperience> {
  authController authObj = Get.put(authController());


  String profileUrl = '';
  final ImagePicker picker = ImagePicker();

  void updateProfileUrl(String newUrl) {
    profileUrl = newUrl;
  }

   final addKey = GlobalKey<FormState>();

  DateTime? selectedDate;

  Future<void> _selectedStartDate(BuildContext context) async {
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

  Future<void> _selectedEndDate(BuildContext context) async {
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
        authObj.endDate.text = formattedDate.toString();
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
                        controller:authObj.title,
                        keyboardType: TextInputType.text,
                        decoration: AppTheme.customDecoration("title"),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        controller: authObj.company,
                        keyboardType: TextInputType.text,
                        decoration: AppTheme.customDecoration("Company"),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        controller: authObj.startDate,
                        decoration: AppTheme.customDecoration("Start date"),
                        onTap: () async {
                          await _selectedStartDate(context);
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        controller: authObj.endDate,
                        decoration: AppTheme.customDecoration("End date"),
                        onTap: () async{
                          await _selectedEndDate(context);
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        controller: authObj.description,
                        decoration: AppTheme.customDecoration("Description"),
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
