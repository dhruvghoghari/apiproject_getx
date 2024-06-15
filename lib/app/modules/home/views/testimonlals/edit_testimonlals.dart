import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import '../../controllers/auth_controller.dart';

class EditTestimonial extends StatefulWidget {
  const EditTestimonial({super.key});

  @override
  State<EditTestimonial> createState() => _EditTestimonialState();
}

class _EditTestimonialState extends State<EditTestimonial> {
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
      body:Column(
        children: [

        ],
      )
    );
  }
}
