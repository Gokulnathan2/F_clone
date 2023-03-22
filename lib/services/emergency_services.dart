import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:gokul_f/model/dash_board_model.dart';
import 'package:gokul_f/model/emergency_model.dart';
import 'package:gokul_f/screens/login/environment_screen.dart';
import 'package:http/http.dart' as http;
import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:gokul_f/model/login_response_model.dart';
import 'package:gokul_f/services/login_services.dart';

class EmergencyService {
  static final storage = FlutterSecureStorage();
  static const FETCH_LIMIT = 20;
  // EmergencyService({required this.service});

  Future<dynamic> emergencyService(int page) async {
    try {
      dynamic token = await LoginService.getToken();
      dynamic baseurl1 = await EnvironmentScreenState.getBaseurl() as dynamic;
      final Dio service = Dio(BaseOptions(baseUrl: 'https://${baseurl1}'));

      //print('ls${token}');
      bool validateStatus(status) {
        return status! <= 500;
      }

      final options = Options(
          validateStatus: validateStatus,
          headers: {"Authorization": "Bearer ${token}", "source": "android"});
      final response = await service.get(
        '/v1/jobs/?filter=emergency&page=${page}',
        options: options,
      );
      print('tok $token');
      print('reonse${response.toString()}');
      print('response${response.data}');
      //  var data1 = json.decode(response.data);
      print('dat');

      if (response.statusCode == 200) {
        print('ddddsuccess');
        // var data = jsonEncode(response.data) as List<dynamic>;
        // print('data$data');
      } else {
        print(response.statusCode);
      }
      print('reonse${response.data}');
      //var data = jsonDecode(response.toString());
      // debugPrint("response: ${data}");
      //
      // print('response${response}');
      // var data = jsonDecode(response.data) as List<dynamic>;
      //  print('data$data');
      // var data = json.decode(response.data).cast<ObjectName>();
      // Map<String, dynamic> map = json.decode(response.data);
      // List<dynamic> data = map['count'];
      //  final Map<String, dynamic> jsonResult = jsonDecode(response.data);

      // List<EmergencyResponseModel> dolar =
      //     (jsonResult['count'] as List<dynamic>)
      //         .map((data) => EmergencyResponseModel.fromJson(data))
      //         .toList();

      // return jsonDecode(response.data) as List<dynamic>;
      // String jsonsDataString = response.toString();
      // var _data = jsonDecode(jsonsDataString);
      // print(_data.toString());
      // final results = jsonDecode(response.data);
      print("print results: ${response.data['results'].toString()}");
      //return EmergencyResponseModel.fromJson(response.data);
      return response.data as dynamic;
      //  return _data;
    } catch (err) {
      print('error$err');
      return [];
    }
  }
}
