/* part of 'login_response_model.dart';

LoginResponseModel _$LoginResponseModelFromJson(Map<String, dynamic> json) =>
    

Map<String, dynamic> _$LoginResponseModelToJson(LoginResponseModel instance) =>
    <String, dynamic>{
      'token': instance.token,
      'error': instance.error,
      'category': instance.category,
      // 'types': instance.types,
      'domains': instance.domains,
      //'domain': instance.domain,
    };

    export class DomainModel {

    }

  factory DomainModel.fromJson(Map<String, dynamic> json) {
    return _$LoginResponseModelFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$LoginResponseModelToJson(this);
  }
 */