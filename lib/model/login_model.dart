import 'package:json_annotation/json_annotation.dart';

part 'login_model.g.dart';

@JsonSerializable()
class LoginModel {
  String? email;
  String? password;
  // String? domain;
  // String? category;
  // String? types;

  // String? domains;

  LoginModel({
    required this.email,
    required this.password,
    // String? category,
    // String? types,
    // String? domains
  });

  factory LoginModel.fromJson(Map<String, dynamic> json) {
    return _$LoginModelFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$LoginModelToJson(this);
  }
}
