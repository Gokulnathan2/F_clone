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
// // final response = await dio.get('https://example.com/api/data');
