// import 'package:dio/dio.dart';
// import 'package:flutter/material.dart';
// import 'package:gokul_f/services/dashboard_services.dart';

// class EnvironmentUrl {
//   //late String baseUrl;
//   getres(i, baseUrl) {
//     // if (id == 0) {
//     //   print('0');
//     // } else if (id == 1) {
//     //   print('1');
//     // } else if (id == 2) {
//     //   print('2');
//     // } else {
//     //   print('333');
//     // }
//     switch (i) {
//       case 0:
//         print('0,${baseUrl}');
//         // baseUrl = '6ba7-115-97-41-79.ngrok.io';
//         DashBoardService(
//           service: Dio(BaseOptions(baseUrl: baseUrl)),
//         ).dashBoardService();

//         break;
//       case 1:
//         print('1');
//         print('1,${baseUrl}');
//         DashBoardService(
//           service: Dio(BaseOptions(baseUrl: 'https://${baseUrl}')),
//         ).dashBoardService();

//         // baseUrl = 'localhost';
//         break;
//       case 2:
//         print('2');
//         print('2,${baseUrl}');
//         DashBoardService(
//           service: Dio(BaseOptions(baseUrl: 'https://${baseUrl}')),
//         ).dashBoardService();
//         //baseUrl = 'web.devapifyxt.com';
//         break;
//       default:
//         print('3');
//         baseUrl = 'web.devapifyxt.com';
//     }
//   }
// }
