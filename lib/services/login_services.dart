import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:gokul_f/model/login_response_model.dart';

import '../layouts/alert_box.dart';
import '../model/login_model.dart';

class LoginService {
  final Dio service;
  static final storage = FlutterSecureStorage();

  //static var mapResponse;
  LoginService({required this.service});

  Future<LoginResponseModel?> loginService(loginModel) async {
    //Map mapResponse;
    try {
      final data = {
        'email': loginModel.email,
        'password': loginModel.password,
      };

      bool validateStatus(status) {
        return status! <= 500;
      }

      final options = Options(
          validateStatus: validateStatus, headers: {"source": "android"});

      final response = await service.post(
        '/v1/login/',
        options: options,
        data: data,
      );
      print("response in loginservice: ${response}");
      if (response.statusCode == 201) {
        //accessToken = response.data;
        //return true;
        print('s');
      } else {
        // refresh token is wrong
        // accessToken = null;

        //return false;
      }
      return LoginResponseModel.fromJson(response.data);
    } catch (Error) {
      print('err$Error');
      //ReuseAlertDialogBox().alertDialog(context "Alert", Error.toString()!);
    }
  }

  static Future<void> storeToken(String token) async {
    await storage.write(key: "token", value: token);
  }

  static Future<String?> getToken() async {
    dynamic token = await storage.read(key: "token");
    return token;
  }
}
