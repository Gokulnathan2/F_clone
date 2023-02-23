part of 'environment_response_model.dart';

LoginResponseModel _$LoginResponseModelFromJson(Map<String, dynamic> json) =>
    LoginResponseModel(
        token: json['token'] as String?,
        error: json['error'] as String?,
        // domain: json['domains'] as String?
        category: json['category'] as String?,
        types: json['types'] as String?,
        domains: json['domains'] as String?);

Map<String, dynamic> _$LoginResponseModelToJson(LoginResponseModel instance) =>
    <String, dynamic>{
      'token': instance.token,
      'error': instance.error,
      'category': instance.category,
      'types': instance.types,
      'domains': instance.domains,
      //'domain': instance.domain,
    };
