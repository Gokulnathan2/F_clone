// // //import 'dart:html';

// import 'package:flutter_secure_storage/flutter_secure_storage.dart';
// import 'package:http/http.dart' as http;

// class NetWorkHandler {
//   static final client = http.Client();
//   static final storage = FlutterSecureStorage();
//   static Future<String> post(var body, String endpoint) async {
//     var response = await client.post(buildUrl(endpoint),
//         body: body, headers: {"content-type": "application/json"});
//     return response.body;
//   }

//   static Uri buildUrl(String endpoint) {
//     String host = "https://devapifyxt.com/v1/login/";
//     final apipath = host + endpoint;
//     return Uri.parse(apipath);
//   }

//   static void storeToken(String token) async {
//     await storage.write(key: "token", value: token);
//   }

//   static Future<String?> getToken(String token) async {
//     return await storage.read(key: "token");
//   }
// }
