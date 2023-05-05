import 'package:json_annotation/json_annotation.dart';

@JsonSerializable()
class DashBoardResponseModel {
  int? emergency;
  int? all_jobs;
  int? assigned_to_me;

  DashBoardResponseModel({
    this.emergency,
    this.all_jobs,
    this.assigned_to_me,
  });

  factory DashBoardResponseModel.fromJson(Map<String, dynamic> json) {
    return DashBoardResponseModel(
      emergency: json['emergency'] as int?,
      all_jobs: json['all_jobs'] as int?,
      assigned_to_me: json['action_required'] as int?,
    );
  }

//   Map<String, dynamic> toJson() {
//     return {
//       'emergency': this.emergency,
//       'category': this.all_jobs,
//       'action_required': this.assigned_to_me,
//     };
//   }
}


  // Map<String, dynamic> toJson() {
  //   return {'name': this.action_required, 'host': this.host};
  // }

