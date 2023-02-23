import 'package:json_annotation/json_annotation.dart';

part 'environment_response_model.g.dart';

@JsonSerializable()
class LoginResponseModel {
  String? token;
  String? error;
  String? category;
  String? types;
  String? domains;
  //String? domain;
  //  String? category;
  // List<String?>? types;
  // List<String?>? domains;

  LoginResponseModel({
    this.token,
    this.error,
    // this.domain,
    this.category,
    this.types,
    this.domains,
  });

  factory LoginResponseModel.fromJson(Map<String, dynamic> json) {
    return _$LoginResponseModelFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$LoginResponseModelToJson(this);
  }
}
