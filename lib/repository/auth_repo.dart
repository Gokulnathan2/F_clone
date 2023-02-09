import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;

class AuthRepository {
  //static final client = http.Client();
  static final storage = FlutterSecureStorage();
  Future login(String email, String password) async {
    var res = await http.post(Uri.parse("https://devapifyxt.com/v1/login/"),
        headers: {}, body: {"email": email, "password": password});
    final data = json.decode(res.body);
    print(res.body);
    // print(data['token']);
    final List<String> dataList = data['domains'];
    var token = data['token'];
    // var token = data.token;
    // print(token);
    // if (data['category'] == " Customer" || data['types' == "Manager"]) {
    //   return data;
    // } else {
    //   return "auth problem";
    // }
    // Future<void> storeToken(String token) async {

    // }
    //   String sttoken = await storage.get('token');
    // print(sttoken);

    // Future<String?> getToken(String token) async {
    //   return await storage.read(key: "token");
    //   //     String sttoken = await storage.get('token');
    //   // print(sttoken);
    //   //  return await storage.get(res);
    // }

    if (res.statusCode == 200) {
      print('auth success');
      // return json.decode(res.body) as List<Map<String, dynamic>>;

      //await storage.write(key: "token", value: token);
      //print(getToken.toString());
//Navigator.pushNamed(context, Route(builder: (context) => '/forgotscreen'));
      // Map<String, String> allValues = await storage.readAll();
    } else {
      print('failed');
      //return Scaffold().bottomSheet;
    }
  }

  // static void storeToken(String token) async {
  //   await storage.write(key: "token", value: token);
  // }

  // static Future<String?> getToken(String token) async {
  //   return await storage.read(key: "token");
  // }
}

// class UserRepositories {
//   static String mainUrl = "https://devapifyxt.com";
//   var loginUrl = '$mainUrl/v1/login/';
//   final FlutterSecureStorage storage = FlutterSecureStorage();
//   final Dio _dio = Dio();

//   Future<bool> hasToken() async {
//     var value = await storage.read(key: 'token');
//     if (value != null) {
//       return true;
//     } else {
//       return false;
//     }
//   }

//   Future<void> persisteToken(String token) async {
//     await storage.write(key: 'token', value: token);
//   }

//   Future<void> deleteToken() async {
//     storage.delete(key: 'token');
//     storage.deleteAll();
//   }

//   Future<String> login(String email, String password) async {
//     Response response =
//         await _dio.post(loginUrl, data: {"email": email, "password": password});
//     return response.data["token"];
//   }
// }
//async 