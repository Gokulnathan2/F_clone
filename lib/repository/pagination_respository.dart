import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:gokul_f/model/emergency_model.dart';
import 'package:gokul_f/screens/login/environment_screen.dart';
import 'package:gokul_f/services/emergency_services.dart';

class PaginationRepository {
  final EmergencyService service;

  PaginationRepository(this.service);

  Future<List<Result>> fetchPosts(int page) async {
    final dataResults = await service.emergencyService(page);
    final jsonData = EmergencyResponseModel.fromJson(dataResults);
    print('dr${dataResults}');
    // print('type of results: ${jsonData.runtimeType}');
    //return results;
    return jsonData.results;
    // return posts.toList();
    // return posts as List<EmergencyResponseModel>;
    //return posts ;
  }
}
