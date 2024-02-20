import 'package:flutter/material.dart';

class AppTheme
{

  static const loginBtnColor = Colors.black;
  static const borderColor = Colors.grey;

  static InputDecoration customDecoration(String hintText, {String? label}) {
    return InputDecoration(
      labelText: label,
      alignLabelWithHint: true,
      labelStyle: const TextStyle(fontSize: 15, fontWeight: FontWeight.w400, color: Colors.black),
      hintText: hintText,
      fillColor: Colors.white,
      contentPadding: const EdgeInsets.symmetric(vertical: 25.0, horizontal: 16.0),
      border: const OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(25)),
        gapPadding: 10,
        borderSide: BorderSide(color:borderColor,width: 2),
      ),
      disabledBorder: const OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(25)),
        gapPadding: 10,
        borderSide: BorderSide(color:borderColor,width: 2),
      ),
      enabledBorder: const OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(25)),
        gapPadding: 10,
        borderSide: BorderSide(color:borderColor,width: 2),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(25.0),
        borderSide: const BorderSide(color:loginBtnColor,width: 2),
      ),
      hintStyle: const TextStyle(color: Colors.grey),
    );
  }

}