import 'dart:convert';
//import 'dart:html';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:gokul_f/layouts/dio_interceptor.dart';
import 'package:gokul_f/model/dash_board_model.dart';
import 'package:gokul_f/model/emergency_model.dart';
import 'package:gokul_f/screens/login/environment_screen.dart';
import 'package:http/http.dart' as http;
import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:gokul_f/model/login_response_model.dart';
import 'package:gokul_f/services/login_services.dart';

import '../model/service_model.dart';

class CreateJobService {
  static final storage = FlutterSecureStorage();
  static const FETCH_LIMIT = 20;
  // EmergencyService({required this.service});

  Future<List<dynamic>> createJobService() async {
    try {
      dynamic token = await LoginService.getToken();
      // final dio = Dio();
      // dio.interceptors.add(SessionInterceptor());
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
        '/v1/jobs/service-type/',
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

      //print("print results: ${response.data['results'].toString()}");
      return response.data;
      //  return response.data;
      //  return _data;
    } catch (err) {
      print('error$err');
      return [] as List<dynamic>;
    }
  }

  Future<List<dynamic>> properties() async {
    try {
      dynamic token = await LoginService.getToken();
      // final dio = Dio();
      // dio.interceptors.add(SessionInterceptor());
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
        '/v1/properties/dropdown/',
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

      //  print("print results: ${response.data['results'].toString()}");
      //return EmergencyResponseModel.fromJson(response.data);
      return response.data;
      //  return _data;
    } catch (err) {
      print('error$err');
      return [];
    }
  }

  Future<dynamic> location() async {
    try {
      dynamic token = await LoginService.getToken();
      // final dio = Dio();
      // dio.interceptors.add(SessionInterceptor());
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
        '/v1/properties/9ada2d89-5832-4ca1-82de-bdeb2f8a5fdf/units/',
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

      print("print results: ${response.data['results'].toString()}");
      //return EmergencyResponseModel.fromJson(response.data);
      return response.data as dynamic;
      //  return _data;
    } catch (err) {
      print('error$err');
      return [];
    }
  }

  Future<dynamic> categories() async {
    try {
      dynamic token = await LoginService.getToken();
      // final dio = Dio();
      // dio.interceptors.add(SessionInterceptor());
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
        '/v1/fyxt-categories/',
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
