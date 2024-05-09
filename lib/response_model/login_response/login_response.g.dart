// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LoginResponse _$LoginResponseFromJson(Map<String, dynamic> json) =>
    LoginResponse(
      page: (json['page'] as num?)?.toInt(),
      per_page: (json['per_page'] as num?)?.toInt(),
      total: (json['total'] as num?)?.toInt(),
      total_pages: (json['total_pages'] as num?)?.toInt(),
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => LoginData.fromJson(e as Map<String, dynamic>))
          .toList(),
      support: json['support'] == null
          ? null
          : Support.fromJson(json['support'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$LoginResponseToJson(LoginResponse instance) =>
    <String, dynamic>{
      'page': instance.page,
      'per_page': instance.per_page,
      'total': instance.total,
      'total_pages': instance.total_pages,
      'data': instance.data,
      'support': instance.support,
    };

LoginData _$LoginDataFromJson(Map<String, dynamic> json) => LoginData(
      id: (json['id'] as num?)?.toInt(),
      name: json['name'] as String?,
      year: (json['year'] as num?)?.toInt(),
      color: json['color'] as String?,
      pantone_value: json['pantone_value'] as String?,
    );

Map<String, dynamic> _$LoginDataToJson(LoginData instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'year': instance.year,
      'color': instance.color,
      'pantone_value': instance.pantone_value,
    };

Support _$SupportFromJson(Map<String, dynamic> json) => Support(
      url: json['url'] as String?,
      text: json['text'] as String?,
    );

Map<String, dynamic> _$SupportToJson(Support instance) => <String, dynamic>{
      'url': instance.url,
      'text': instance.text,
    };
