// To parse this JSON data, do

//    final emergencyResponseModel = emergencyResponseModelFromJson(jsonString);

import 'dart:convert';

EmergencyResponseModel emergencyResponseModelFromJson(String str) =>
    EmergencyResponseModel.fromJson(json.decode(str));

String emergencyResponseModelToJson(EmergencyResponseModel data) =>
    json.encode(data.toJson());

class EmergencyResponseModel {
  EmergencyResponseModel({
    required this.count,
    required this.next,
    this.previous,
    required this.results,
  });

  int count;
  String next;
  dynamic previous;
  List<Result> results;

  factory EmergencyResponseModel.fromJson(Map<String, dynamic> json) {
    List<Result> resultList = List<Result>.from(
        json["results"].map((x) => Result.fromJson(x)).toList());
    return EmergencyResponseModel(
      count: json["count"],
      next: json["next"],
      previous: json["previous"],
      results: resultList,
      //  List<Result>.from(json["results"].map((x) => Result.fromJson(x))),
    );
  }

  Map<String, dynamic> toJson() => {
        "count": count,
        "next": next,
        "previous": previous,
        "results": results,
        //List<dynamic>.from(results.map((x) => x.toJson())),
      };

  map(Result Function(dynamic e) param0) {}
}

class Result {
  Result({
    required this.id,
    required this.courtesyJob,
    required this.type,
    required this.description,
    required this.issueType,
    required this.category,
    this.property,
    required this.status,
    required this.stage,
    this.requestType,
    required this.unit,
    this.priority,
    this.serviceType,
    required this.source,
  });

  int id;
  bool courtesyJob;
  Type type;
  String description;
  String issueType;
  String category;
  String? property;
  String status;
  Stage stage;
  RequestType? requestType;
  String unit;
  String? priority;
  String? serviceType;
  Source source;

  factory Result.fromJson(Map<String, dynamic> json) => Result(
        id: json["id"],
        courtesyJob: json["courtesy_job"],
        type: typeValues.map[json["type"]]!,
        description: json["description"],
        issueType: json["issue_type"],
        category: json["category"],
        property: propertyValues.map[json["property"]],
        status: json["status"],
        stage: Stage.fromJson(json["stage"]),
        requestType: requestTypeValues.map[json["request_type"]],
        unit: json["unit"] ?? '',
        priority: priorityValues.map[json["priority"]],
        serviceType: json["service_type"],
        source: sourceValues.map[json["source"]]!,
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "courtesy_job": courtesyJob,
        "type": typeValues.reverse[type],
        "description": description,
        "issue_type": issueType,
        "category": category,
        "property": propertyValues.reverse[property],
        "status": status,
        "stage": stage.toJson(),
        "request_type": requestTypeValues.reverse[requestType],
        "unit": unit,
        "priority": priorityValues.reverse[priority],
        "service_type": serviceType,
        "source": sourceValues.reverse[source],
      };
}

enum Priority { EMERGENCY }

final priorityValues = EnumValues({"Emergency": 'EMERGENCY'});

enum Property { IT, DLF, THIN_Q24, FLIPKART }

final propertyValues = EnumValues(
    {"DLF": 'DLF', "flipkart": 'flipkart', "IT": 'IT', "thinQ24": 'THIN_Q24'});

enum RequestType { IN_UNIT }

final requestTypeValues = EnumValues({"In Unit": RequestType.IN_UNIT});

enum Source { IN_SYSTEM, SERVICE_PLANNER }

final sourceValues = EnumValues(
    {"In System": Source.IN_SYSTEM, "Service Planner": Source.SERVICE_PLANNER});

class Stage {
  Stage({
    required this.id,
    required this.name,
  });

  String id;
  Name name;

  factory Stage.fromJson(Map<String, dynamic> json) => Stage(
        id: json["id"],
        name: nameValues.map[json["name"]]!,
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": nameValues.reverse[name],
      };
}

enum Name { IN_PROGRESS, CLOSED, TO_DO, COMPLETED }

final nameValues = EnumValues({
  "Closed": Name.CLOSED,
  "Completed": Name.COMPLETED,
  "In Progress": Name.IN_PROGRESS,
  "To Do": Name.TO_DO
});

enum Type { REGULAR }

final typeValues = EnumValues({"Regular": Type.REGULAR});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}

// import 'dart:convert';

// EmergencyResponseModel emergencyResponseModelFromJson(String str) =>
//     EmergencyResponseModel.fromJson(json.decode(str));

// String emergencyResponseModelToJson(EmergencyResponseModel data) =>
//     json.encode(data.toJson());

// class EmergencyResponseModel {
//   EmergencyResponseModel({
//     required this.results,
//   });

//   List<Result> results;

//   factory EmergencyResponseModel.fromJson(Map<String, dynamic> json) =>
//       EmergencyResponseModel(
//         results:
//             List<Result>.from(json["results"].map((x) => Result.fromJson(x))),
//       );

//   Map<String, dynamic> toJson() => {
//         "results": List<dynamic>.from(results.map((x) => x.toJson())),
//       };
// }

// class Result {
//   Result({
//     required this.id,
//     required this.courtesyJob,
//     required this.type,
//     required this.description,
//     required this.issueType,
//     required this.category,
//     required this.property,
//     required this.status,
//     required this.stage,
//     required this.requestType,
//     required this.unit,
//     required this.priority,
//     this.serviceType,
//     required this.source,
//     required this.requestedBy,
//   });

//   int id;
//   bool courtesyJob;
//   Type type;
//   String description;
//   String issueType;
//   String category;
//   Property property;
//   String status;
//   Stage stage;
//   RequestType requestType;
//   String unit;
//   Priority priority;
//   String? serviceType;
//   Source source;
//   RequestedBy requestedBy;

//   factory Result.fromJson(Map<String, dynamic> json) => Result(
//         id: json["id"],
//         courtesyJob: json["courtesy_job"],
//         type: typeValues.map[json["type"]]!,
//         description: json["description"],
//         issueType: json["issue_type"],
//         category: json["category"],
//         property: propertyValues.map[json["property"]]!,
//         status: json["status"],
//         stage: Stage.fromJson(json["stage"]),
//         requestType: requestTypeValues.map[json["request_type"]]!,
//         unit: json["unit"],
//         priority: priorityValues.map[json["priority"]]!,
//         serviceType: json["service_type"],
//         source: sourceValues.map[json["source"]]!,
//         requestedBy: requestedByValues.map[json["requested_by"]]!,
//       );

//   Map<String, dynamic> toJson() => {
//         "id": id,
//         "courtesy_job": courtesyJob,
//         "type": typeValues.reverse[type],
//         "description": description,
//         "issue_type": issueType,
//         "category": category,
//         "property": propertyValues.reverse[property],
//         "status": status,
//         "stage": stage.toJson(),
//         "request_type": requestTypeValues.reverse[requestType],
//         "unit": unit,
//         "priority": priorityValues.reverse[priority],
//         "service_type": serviceType,
//         "source": sourceValues.reverse[source],
//         "requested_by": requestedByValues.reverse[requestedBy],
//       };
// }

// enum Priority { EMERGENCY }

// final priorityValues = EnumValues({"Emergency": Priority.EMERGENCY});

// enum Property { IT, DLF, THIN_Q24, FLIPKART }

// final propertyValues = EnumValues({
//   "DLF": Property.DLF,
//   "flipkart": Property.FLIPKART,
//   "IT": Property.IT,
//   "thinQ24": Property.THIN_Q24
// });

// enum RequestType { IN_UNIT }

// final requestTypeValues = EnumValues({"In Unit": RequestType.IN_UNIT});

// enum RequestedBy { ENGINEER, OWNER, TENANT, MANAGER }

// final requestedByValues = EnumValues({
//   "Engineer": RequestedBy.ENGINEER,
//   "Manager": RequestedBy.MANAGER,
//   "Owner": RequestedBy.OWNER,
//   "Tenant": RequestedBy.TENANT
// });

// enum Source { IN_SYSTEM, SERVICE_PLANNER }

// final sourceValues = EnumValues(
//     {"In System": Source.IN_SYSTEM, "Service Planner": Source.SERVICE_PLANNER});

// class Stage {
//   Stage({
//     required this.id,
//     required this.name,
//   });

//   String id;
//   Name name;

//   factory Stage.fromJson(Map<String, dynamic> json) => Stage(
//         id: json["id"],
//         name: nameValues.map[json["name"]]!,
//       );

//   Map<String, dynamic> toJson() => {
//         "id": id,
//         "name": nameValues.reverse[name],
//       };
// }

// enum Name { IN_PROGRESS, CLOSED, TO_DO, COMPLETED }

// final nameValues = EnumValues({
//   "Closed": Name.CLOSED,
//   "Completed": Name.COMPLETED,
//   "In Progress": Name.IN_PROGRESS,
//   "To Do": Name.TO_DO
// });

// enum Type { REGULAR }

// final typeValues = EnumValues({"Regular": Type.REGULAR});

// class EnumValues<T> {
//   Map<String, T> map;
//   late Map<T, String> reverseMap;

//   EnumValues(this.map);

//   Map<T, String> get reverse {
//     reverseMap = map.map((k, v) => MapEntry(v, k));
//     return reverseMap;
//   }
// }
