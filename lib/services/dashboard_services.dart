import 'dart:convert';
import 'package:gokul_f/model/dash_board_model.dart';
import 'package:http/http.dart' as http;
import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:gokul_f/model/login_response_model.dart';
import 'package:gokul_f/services/login_services.dart';

class DashBoardService {
  final Dio service;
  static final storage = FlutterSecureStorage();

  DashBoardService({required this.service});

  Future<DashBoardResponseModel?> dashBoardService() async {
    dynamic token = await LoginService.getToken();
    //print('ls${token}');
    bool validateStatus(status) {
      return status! <= 500;
    }

    final options = Options(
        validateStatus: validateStatus,
        headers: {"Authorization": "Bearer ${token}", "source": "android"});
    final response = await service.get(
      '/v1/dashboard/',
      options: options,
      //data: data,
    );
    print(token);
    if (response.statusCode == 200) {
      print('sucess');
    } else {
      print(response.statusCode);
    }
    //var data = jsonDecode(response.toString());
    print("response in dashboardservice: ${response.data}");
    return DashBoardResponseModel.fromJson(response.data);
  }
}
