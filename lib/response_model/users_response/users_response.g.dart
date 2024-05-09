// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'users_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UsersResponse _$UsersResponseFromJson(Map<String, dynamic> json) =>
    UsersResponse(
      page: (json['page'] as num?)?.toInt(),
      per_page: (json['per_page'] as num?)?.toInt(),
      total: (json['total'] as num?)?.toInt(),
      total_pages: (json['total_pages'] as num?)?.toInt(),
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => UsersData.fromJson(e as Map<String, dynamic>))
          .toList(),
      support: json['support'] == null
          ? null
          : UsersSupport.fromJson(json['support'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$UsersResponseToJson(UsersResponse instance) =>
    <String, dynamic>{
      'page': instance.page,
      'per_page': instance.per_page,
      'total': instance.total,
      'total_pages': instance.total_pages,
      'data': instance.data,
      'support': instance.support,
    };

UsersData _$UsersDataFromJson(Map<String, dynamic> json) => UsersData(
      id: (json['id'] as num?)?.toInt(),
      email: json['email'] as String?,
      first_name: json['first_name'] as String?,
      last_name: json['last_name'] as String?,
      avatar: json['avatar'] as String?,
    );

Map<String, dynamic> _$UsersDataToJson(UsersData instance) => <String, dynamic>{
      'id': instance.id,
      'email': instance.email,
      'first_name': instance.first_name,
      'last_name': instance.last_name,
      'avatar': instance.avatar,
    };

UsersSupport _$UsersSupportFromJson(Map<String, dynamic> json) => UsersSupport(
      url: json['url'] as String?,
      text: json['text'] as String?,
    );

Map<String, dynamic> _$UsersSupportToJson(UsersSupport instance) =>
    <String, dynamic>{
      'url': instance.url,
      'text': instance.text,
    };
