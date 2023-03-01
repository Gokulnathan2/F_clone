import 'dart:ffi';

import 'package:json_annotation/json_annotation.dart';

@JsonSerializable()
class LoginResponseModel {
  String? token;
  String? error;
  // String? types;
  String? category;
  // List<String>? types;
  List<DomainModel>? domains;

  LoginResponseModel({
    this.token,
    this.error,
    //this.domain,
    this.category,
    // this.types,
    this.domains,
  });

  factory LoginResponseModel.fromJson(Map<String, dynamic> json) {
    var domainList = json['domains'] as List;
    List<DomainModel> parsedDomainList =
        domainList.map((d) => DomainModel.fromJson(d)).toList();
    return LoginResponseModel(
        token: json['token'] as String?,
        error: json['error'] as String?,
        //  domain: json['domains'] as String?
        category: json['category'] as String?,
        // types: json['types'] as List<String>?,
        domains: parsedDomainList);
  }

  Map<String, dynamic> toJson() {
    return {
      'token': this.token,
      'error': this.error,
      'category': this.category,
      // 'types': this.types,
      'domains': this.domains,
      //'domain': instance.domain,
    };
  }
}

class DomainModel {
  String? name;
  String? host;
  DomainModel({this.name, this.host});

  factory DomainModel.fromJson(Map<String, dynamic> json) {
    return DomainModel(name: json['name'], host: json['host']);
  }

  Map<String, dynamic> toJson() {
    return {'name': this.name, 'host': this.host};
  }
}
