import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:gokul_f/model/login_response_model.dart';

class DashBoardService {
  final Dio service;
  static final storage = FlutterSecureStorage();

  //static var mapResponse;
  DashBoardService({required this.service});

  Future<LoginResponseModel?> dashBoardService() async {
    //Map mapResponse;
    // final data = {
    //   'email': loginModel.email,
    //   'password': loginModel.password,
    // };

    bool validateStatus(status) {
      return status! <= 500;
    }

    final options =
        Options(validateStatus: validateStatus, headers: {"source": "android"});
    final response = await service.get(
      '/v1/dashboard/',
      options: options,
      //data: data,
    );
    print("response in loginservice: ${response}");
    return LoginResponseModel.fromJson(response.data);
  }

  // static Future<void> storeToken(String token) async {
  //   await storage.write(key: "token", value: token);
  // }

  // static Future<String?> getToken(String token) async {
  //   return await storage.read(key: "token");
  // }
}
