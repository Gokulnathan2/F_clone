import 'dart:convert';
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

    // if (data['category'] == " Customer" || data['types' == "Manager"]) {
    //   return data;
    // } else {
    //   return "auth problem";
    // }
    if (res.statusCode == 200) {
      print('auth success');
    } else {
      print('failed');
    }
  }

  static void storeToken(String token) async {
    await storage.write(key: "token", value: token);
  }

  static Future<String?> getToken(String token) async {
    return await storage.read(key: "token");
  }
}
