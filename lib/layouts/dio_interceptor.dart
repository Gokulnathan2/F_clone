// import 'package:dio/dio.dart';
// import 'package:gokul_f/model/login_response_model.dart';
// import 'package:gokul_f/services/login_services.dart';

// class SessionInterceptor extends Interceptor {
//   //static String token;
//   dynamic token =  LoginService.getToken();

//   @override
//   Future onRequest(RequestOptions options) async {
//     if (token != null) {
//       options.headers['Authorization'] = 'Bearer $token';
//     }
//     return options;
//   }

//   @override
//   Future onResponse(Response response) async {
//     // Check the response status code and do something based on it.
//     if (response.statusCode == 401) {
//       // Clear the token and do something like navigate to the login screen.
//    //token = null;
//     }
//     return response;
//   }
// }

// // Create a Dio instance and add the interceptor to it.
// // final dio = Dio();
// // dio.interceptors.add(SessionInterceptor());
// // // final response = await dio.get('https://example.com/api/data');
// import 'package:dio/dio.dart';
// import 'package:gokul_f/model/login_response_model.dart';
// import 'package:gokul_f/services/login_services.dart';

// class SessionInterceptor extends Interceptor  {
//   //static String token;
//   dynamic token =  LoginService.getToken();

//   @override
//   Future onRequest(RequestOptions options) async {
//     if (token != null) {
//       options.headers['Authorization'] = 'Bearer $token';
//     }
//     return options;
//   }

//   @override
//   Future onResponse(Response response) async {
//     // Check the response status code and do something based on it.
//     if (response.statusCode == 401) {
//       // Clear the token and do something like navigate to the login screen.
//    //token = null;
//     }
//     return response;
//   }
// }
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gokul_f/screens/login/view/login_view.dart';

class MyHome extends StatefulWidget {
  const MyHome({Key? key}) : super(key: key);

  @override
  _MyHomeState createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> {
  var strRes;

  Future<void> getapi() async {
    Dio dio = Dio();
    dio.interceptors.add(InterceptorsWrapper(onRequest: (options, handler) {
      print('onRequest: ${options.method} ${options.path}');
      return handler.next(options);
    }, onResponse: (response, handler) {
      print(
          'onResponse: ${response.statusCode} ${response.requestOptions.path}');
      return handler.next(response);
    }, onError: (DioError error, handler) {
      if (error.response == null) {
        print('onError: ${error.message}');
      } else {
        print(
            'onError: ${error.message} ${error.response!.statusCode} ${error.requestOptions.path}');
      }
      return handler.next(error);
    }));
    try {
      var response = await dio.get("https://reqres./api/users/2");
      if (response.statusCode == 200) {
        print('get_${response.data}');
        setState(() {
          strRes = response.data;
        });
      }
    } on DioError catch (e) {
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => LoginView(),
          ));
    }
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }
}
