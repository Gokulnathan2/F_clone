// // To parse this JSON data, do
// //
// //     final loctaionServiceType = loctaionServiceTypeFromJson(jsonString);

// import 'dart:convert';

// List<LoctaionServiceType> loctaionServiceTypeFromJson(String str) =>
//     List<LoctaionServiceType>.from(
//         json.decode(str).map((x) => LoctaionServiceType.fromJson(x)));

// String loctaionServiceTypeToJson(List<LoctaionServiceType> data) =>
//     json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

// class LoctaionServiceType {
//   LoctaionServiceType({
//     required this.address,
//     required this.units,
//   });

//   String address;
//   List<Unit> units;

//   factory LoctaionServiceType.fromJson(Map<String, dynamic> json) =>
//       LoctaionServiceType(
//         address: json["address"],
//         units: List<Unit>.from(json["units"].map((x) => Unit.fromJson(x))),
//       );

//   Map<String, dynamic> toJson() => {
//         "address": address,
//         "units": List<dynamic>.from(units.map((x) => x.toJson())),
//       };
// }

// class Unit {
//   Unit({
//     required this.id,
//     required this.name,
//     required this.status,
//     required this.tenant,
//   });

//   String id;
//   String name;
//   Status status;
//   Tenant tenant;

//   factory Unit.fromJson(Map<String, dynamic> json) => Unit(
//         id: json["id"],
//         name: json["name"],
//         status: statusValues.map[json["status"]]!,
//         tenant: Tenant.fromJson(json["tenant"]),
//       );

//   Map<String, dynamic> toJson() => {
//         "id": id,
//         "name": name,
//         "status": statusValues.reverse[status],
//         "tenant": tenant.toJson(),
//       };
// }

// enum Status { OCCUPIED }

// final statusValues = EnumValues({"Occupied": Status.OCCUPIED});

// class Tenant {
//   Tenant({
//     required this.name,
//     required this.onboarded,
//   });

//   String name;
//   bool onboarded;

//   factory Tenant.fromJson(Map<String, dynamic> json) => Tenant(
//         name: json["name"],
//         onboarded: json["onboarded"],
//       );

//   Map<String, dynamic> toJson() => {
//         "name": name,
//         "onboarded": onboarded,
//       };
// }

// class EnumValues<T> {
//   Map<String, T> map;
//   late Map<T, String> reverseMap;

//   EnumValues(this.map);

//   Map<T, String> get reverse {
//     reverseMap = map.map((k, v) => MapEntry(v, k));
//     return reverseMap;
//   }
// }
