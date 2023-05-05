//import 'dart:html';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:gokul_f/layouts/dio_interceptor.dart';
//import 'package:gokul_f/model/Location.dart';
import 'package:gokul_f/model/dash_board_model.dart';
import 'package:gokul_f/model/emergency_model.dart';
import 'package:gokul_f/screens/login/environment_screen.dart';
import 'package:http/http.dart' as http;
import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:gokul_f/model/login_response_model.dart';
import 'package:gokul_f/services/login_services.dart';
import 'package:http_parser/http_parser.dart';
import '../model/Location.dart';
import '../model/service_model.dart';
import 'package:mime/mime.dart';

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

  Future<dynamic> location(id) async {
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
        '/v1/properties/$id/units/',
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
      //return LoctaionServiceType.fromJson(response.data);
      return response.data as dynamic;
      // return response.data;
      //  return _data;
    } catch (err) {
      print('error$err');
      return [];
    }
  }

  Future<dynamic> categories(PropertyId) async {
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
        '/v1/properties/$PropertyId/categories/',
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

      // print("print results: ${response.data['results'].toString()}");
      //return EmergencyResponseModel.fromJson(response.data);
      return response.data as dynamic;
      //  return _data;
    } catch (err) {
      print('error$err');
      return [];
    }
  }

  Future<dynamic> priority() async {
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
        '/v1/jobs/priorities/',
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

      // print("print results: ${response.data['results'].toString()}");
      //return EmergencyResponseModel.fromJson(response.data);
      return response.data as dynamic;
      //  return _data;
    } catch (err) {
      print('error$err');
      return [];
    }
  }

  Future<dynamic> uploadImages(imageFiles) async {
    try {
      dynamic token = await LoginService.getToken();
      dynamic baseurl1 = await EnvironmentScreenState.getBaseurl() as dynamic;
      print(baseurl1);
      final Dio service = Dio(BaseOptions(baseUrl: 'https://${baseurl1}'));
      bool validateStatus(status) {
        return status! <= 500;
      }

      final options = Options(
          validateStatus: validateStatus,
          headers: {"Authorization": "Bearer ${token}", "source": "android"});
      FormData formData = FormData();
      dynamic data = {'file': imageFiles, 'mime_Type': 'png'};
      for (var i = 0; i < imageFiles.length; i++) {
        // var mimeType = lookupMimeType(imageFiles[i].path);
        print(imageFiles[i].path);
        formData.files.add(MapEntry(
          'file',
          await MultipartFile.fromFile(
            imageFiles[i].path,
            // filename: 'image$i.jpeg',
            // contentType: MediaType.parse(mimeType!)
          ),
        ));
        formData.fields.add(MapEntry('mime_type', 'image/png'));
        formData.fields.add(MapEntry('description', 'photo'));
        formData.fields.add(MapEntry('source', 'Job'));
        formData.fields.add(MapEntry('type', 'Pre Completion'));
      }

      var response = await service.post(
        '/v1/photos/',
        data: formData,
        options: options,
      );

      if (response.statusCode == 201) {
        print('photo upload');
        print(formData.files);
        print(response.data);
        print(response.statusCode);
        return response.data;
        // Do something with the response
      } else {
        // print(formData.files);
        // print(formData);
        // print(imageFiles);
        print(response.data);
        print(response.statusCode);
        // Handle the error
      }
    } catch (e) {
      print('e$e');
      // Handle the exception
    }
  }

  Future<dynamic> uploadImagesDelete(imageFilesId) async {
    try {
      dynamic token = await LoginService.getToken();
      dynamic baseurl1 = await EnvironmentScreenState.getBaseurl() as dynamic;
      final Dio service = Dio(BaseOptions(baseUrl: 'https://${baseurl1}'));
      bool validateStatus(status) {
        return status! <= 500;
      }

      final options = Options(
          validateStatus: validateStatus,
          headers: {"Authorization": "Bearer ${token}", "source": "android"});

      var response = await service.delete(
        '/v1/photos/${imageFilesId}/',
        options: options,
      );

      if (response.statusCode == 201) {
        print('photo upload');
        // print(formData.files);
        print(response.data);
        print(response.statusCode);
        return response.data;
        // Do something with the response
      } else {
        // print(formData.files);
        // print(formData);
        // print(imageFiles);
        print(response.data);
        print(response.statusCode);
        // Handle the error
      }
    } catch (e) {
      print('e$e');
      // Handle the exception
    }
  }

  Future<dynamic> assignManager(propid) async {
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
        '/v1/properties/$propid/managers/',
        options: options,
      );
      print('tok $token');
      //  print('reonse${response.toString()}');
      print('response${response.data}');
      //  var data1 = json.decode(response.data);
      print('dat');

      if (response.statusCode == 200) {
        print('ddddsuccess');
        print('reonse${response.data}');
        // var data = jsonEncode(response.data) as List<dynamic>;
        // print('data$data');
      } else {
        print(response.statusCode);
      }
      print('reonse${response.data}');

      // print("print results: ${response.data['results'].toString()}");
      //return EmergencyResponseModel.fromJson(response.data);
      return response.data as dynamic;
      //  return _data;
    } catch (err) {
      print('error$err');
      return [];
    }
  }

  Future<List<dynamic>> assignEngineer(propid) async {
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
        '/v1/properties/$propid/engineers/',
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

      // print("print results: ${response.data['results'].toString()}");
      //return EmergencyResponseModel.fromJson(response.data);
      return response.data as dynamic;
      //  return _data;
    } catch (err) {
      print('error$err');
      return [];
    }
  }

  Future<dynamic> createJobPost({
    dynamic priority,
    dynamic service_type,
    dynamic property,
    dynamic category,
    dynamic target_date,
    dynamic manager,
    dynamic description,
    dynamic access_instruction,
    List<dynamic>? photos,
    dynamic unitloc,
    dynamic engineers,
    dynamic issue_type,
  }) async {
    try {
      dynamic token = await LoginService.getToken();
      dynamic baseurl1 = await EnvironmentScreenState.getBaseurl() as dynamic;
      print(baseurl1);
      final Dio service = Dio(BaseOptions(baseUrl: 'https://${baseurl1}'));
      bool validateStatus(status) {
        return status! <= 500;
      }

      var data = {
        "service_type": service_type,
        "type": "Regular",
        "request_type": "In Unit",
        "property": property,
        "category": category,
        "target_date": target_date,
        "description": description,
        "access_instruction": access_instruction,
        "unit_entry_permission": false,
        "property_entry_permission": false,
        "skip_site_visit": false,
        "request_feedback_on_close": false,
        "request_auto_response": false,
        "skip_bid": false,
        "courtesy_job": false,
        "request_completion_photos": false,
        "_vendors": [],
        "followers": [],
        "engineers_required": false,
        "engineers": [engineers],
        "photos": photos,
        "pm_assignee": manager,
        "issue_type": issue_type,
        "priority": priority,
        "unit": unitloc,
      };
      final options = Options(
          validateStatus: validateStatus,
          headers: {"Authorization": "Bearer ${token}", "source": "android"});
      // FormData formData = FormData();
      // dynamic data = {'file': imageFiles, 'mime_Type': 'png'};
      // for (var i = 0; i < imageFiles.length; i++) {
      //   // var mimeType = lookupMimeType(imageFiles[i].path);
      //   print(imageFiles[i].path);
      //   formData.files.add(MapEntry(
      //     'file',
      //     await MultipartFile.fromFile(
      //       imageFiles[i].path,
      //       // filename: 'image$i.jpeg',
      //       // contentType: MediaType.parse(mimeType!)
      //     ),
      //   ));
      //   formData.fields.add(MapEntry('mime_type', 'image/png'));
      //   formData.fields.add(MapEntry('description', 'photo'));
      //   formData.fields.add(MapEntry('source', 'Job'));
      //   formData.fields.add(MapEntry('type', 'Pre Completion'));
      // }

      var response = await service.post(
        '/v1/jobs/',
        //queryParameters: params,
        data: data,
        options: options,
      );

      if (response.statusCode == 201) {
        print('job Created');
        //  print(formData.files);

        print(response.statusCode);
        return response.data;
        // Do something with the response
      } else {
        // print(formData.files);
        // print(formData);
        // print(imageFiles);
        //  print(params);
        // print(response.data);
        print(response.statusCode);
        // Handle the error
      }
    } catch (e) {
      print('e$e');
      // Handle the exception
    }
  }
}
