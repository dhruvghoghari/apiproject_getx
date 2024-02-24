import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import '../models/user_all_experience.dart';
import '../models/user_experince.dart';
import 'ErrorHandler.dart';

class ApiHandler {

  static Future<dynamic> postRequest (url,{Map<String,String>? headers, body, encoding}) async {
    // print(body);
    Uri uri = Uri.parse(url);
    try {http.Response response = await http.post(uri, headers: headers, body: body, encoding: encoding);
      // print(response);
      if (response.statusCode == 200) {
         // print(response.body);
        return json.decode(response.body);
      } else {
        throw ErrorHandler(code: response.statusCode,message: "");
      }
    } on FormatException {
      throw ErrorHandler(message: "Bad Response Format",code: 400);
    } on SocketException {
      throw ErrorHandler(message: "Internet Connection Failure",code: 500);
    } on HttpException {
      throw ErrorHandler(message: "Connection Problem",code: 500);
    } on Exception catch (ex) {
      throw ErrorHandler(message: ex.toString().replaceAll("Exception: ", ""),code: 500);
    }
  }

  static Future<dynamic> getRequest(String url, Map<String, String> header) async {
    Uri uri = Uri.parse(url);
    try {
      http.Response response = await http.get(uri, headers: header);
       // print(response.body);
      if (response.statusCode == 200) {
        // print(response);
        return json.decode(json.encode(response.body));
      } else {
        throw ErrorHandler(code: response.statusCode, message: "");
      }
    } on FormatException {
      throw ErrorHandler(message: "Bad Response Format", code: 400);
    }
  }


  static Future<ExperienceResponseModel> experienceData(
      String url, Map<String, String> header) async {
    ExperienceResponseModel model = ExperienceResponseModel();
    Uri uri = Uri.parse(url);
    try {
      var response = await http.get(uri, headers: header);
       print(response.body);

      if (response.statusCode == 200) {
        print(response);
        var data = ExperienceResponseModel.fromJson(jsonDecode(response.body));
        print(data);
        return data;
      } else {
        throw ErrorHandler(code: response.statusCode, message: "");
      }
    } catch (e) {
      e.toString();
      throw ErrorHandler(message: "Bad Response Format", code: 400);
    }
  }


  static Future<ExperienceModel> experienceMainData(
      String url, Map<String, String> header) async {
    ExperienceModel model = ExperienceModel();
    Uri uri = Uri.parse(url);
    try {
      var response = await http.get(uri, headers: header);
      print(response.body);
      if (response.statusCode == 200) {
        print(response);
        var data = ExperienceModel.fromJson(jsonDecode(response.body));
        print(data);
        return data;
      } else {
        throw ErrorHandler(code: response.statusCode, message: "");
      }
    } catch (e) {
      e.toString();
      throw ErrorHandler(message: "Bad Response Format", code: 400);
    }
  }

}