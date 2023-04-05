// To parse this JSON data, do
//
//     final serviceType = serviceTypeFromJson(jsonString);

import 'dart:convert';

List<ServiceType> serviceTypeFromJson(String str) => List<ServiceType>.from(
    json.decode(str).map((x) => ServiceType.fromJson(x)));

String serviceTypeToJson(List<ServiceType> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ServiceType {
  ServiceType({
    required this.id,
    required this.name,
    required this.isDefault,
    required this.isPrimary,
  });

  String id;
  String name;
  bool isDefault;
  bool isPrimary;

  factory ServiceType.fromJson(Map<String, dynamic> json) => ServiceType(
        id: json["id"],
        name: json["name"],
        isDefault: json["is_default"],
        isPrimary: json["is_primary"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "is_default": isDefault,
        "is_primary": isPrimary,
      };
}
