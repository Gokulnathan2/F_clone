// import 'dart:convert';
// //import 'package:flutter_secure_storage/flutter_secure_storage.dart';

// import 'package:flutter/material.dart';
// import 'package:gokul_f/layouts/pop_up.dart';
// //import 'package:gokul_f/screens/login/login_page.dart';
// import 'package:http/http.dart';
import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:gokul_f/model/login_response_model.dart';

import '../model/login_model.dart';

// //import '../layouts/pop_up.dart';

// class LoginService {
//   Future getres(String email, pass) async {
//     try {
//       Response response = await post(
//           Uri.parse('https://devapifyxt.com/v1/login/'),
//           body: {"email": email, "password": pass});
//       print(response.statusCode);
//       //print(response.body.toString());
//       var data = jsonDecode(response.body.toString());
//       print(data);
//       if (response.statusCode == 200) {
//         print('auth success');
//       } else {
//         print('failed');
//       }
//     } catch (e) {
//       print(e.toString());
//     }
//   }
// }
// // static void storeToken(String token) async{
// //   await storage.write(key:"token",value: token);
// // }
// // static Future<String?> getToken(String token) async{
// //   return await Storage.read(key: "token");
// // }
class LoginService {
  final Dio service;
  static final storage = FlutterSecureStorage();

  //static var mapResponse;
  LoginService({required this.service});

  Future<LoginResponseModel?> loginService(LoginModel loginModel) async {
    //Map mapResponse;
    final data = {
      'email': loginModel.email,
      'password': loginModel.password,
    };

    bool validateStatus(status) {
      return status! <= 500;
    }

    final options = Options(validateStatus: validateStatus);
    //var token = data['token'];
    //print(token);
    final response = await service.post(
      '/v1/login/',
      options: options,
      data: data,
    );
    // mapResponse = jsonDecode(response.data);
    // print(mapResponse['domain'].toString());
    return LoginResponseModel.fromJson(response.data);
  }

  static void storeToken(String token) async {
    await storage.write(key: "token", value: token);
  }

  static Future<String?> getToken(String token) async {
    return await storage.read(key: "token");
  }
}
