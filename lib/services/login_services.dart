import 'dart:convert';
//import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import 'package:flutter/material.dart';
import 'package:gokul_f/layouts/pop_up.dart';
//import 'package:gokul_f/screens/login/login_page.dart';
import 'package:http/http.dart';

//import '../layouts/pop_up.dart';

class LoginService {
  Future getres(String email, pass) async {
    try {
      Response response = await post(
          Uri.parse('https://devapifyxt.com/v1/login/'),
          body: {"email": email, "password": pass});
      print(response.statusCode);
      //print(response.body.toString());
      var data = jsonDecode(response.body.toString());
      print(data);
      if (response.statusCode == 200) {
        print('auth success');
      } else {
        print('failed');
      }
    } catch (e) {
      print(e.toString());
    }
  }
}
// static void storeToken(String token) async{
//   await storage.write(key:"token",value: token);
// }
// static Future<String?> getToken(String token) async{
//   return await Storage.read(key: "token");
// }
