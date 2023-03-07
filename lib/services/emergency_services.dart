import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:gokul_f/model/dash_board_model.dart';
import 'package:gokul_f/model/emergency_model.dart';
import 'package:http/http.dart' as http;
import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:gokul_f/model/login_response_model.dart';
import 'package:gokul_f/services/login_services.dart';

class EmergencyService {
  final Dio service;
  static final storage = FlutterSecureStorage();

  EmergencyService({required this.service});

  Future<EmergencyResponseModel?> emergencyService() async {
    dynamic token = await LoginService.getToken();
    //print('ls${token}');
    bool validateStatus(status) {
      return status! <= 500;
    }

    final options = Options(
        validateStatus: validateStatus,
        headers: {"Authorization": "Bearer ${token}", "source": "android"});
    final response = await service.get(
      '',
      // '/v1/jobs/?filter=emergency',
      options: options,
    );
    print(token);
    if (response.statusCode == 200) {
      print('ddddsuccess');
    } else {
      print(response.statusCode);
    }
    var data = jsonDecode(response.toString());
    debugPrint("response: ${data}");
    return EmergencyResponseModel.fromJson(response.data);
  }
}
