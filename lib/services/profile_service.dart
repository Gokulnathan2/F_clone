import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../screens/login/environment_screen.dart';
import 'login_services.dart';

class ProfileService {
  static final storage = FlutterSecureStorage();
  static const FETCH_LIMIT = 20;
  // EmergencyService({required this.service});

  Future<dynamic> profileServ() async {
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
        '/v1/users/profile/',
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
      //return EmergencyResponseModel.fromJson(response.data);
      return response.data as dynamic;
      //  return _data;
    } catch (err) {
      print('error$err');
      return [];
    }
  }
}
