
import 'package:json_annotation/json_annotation.dart';
part 'users_response.g.dart';

@JsonSerializable()
class UsersResponse {
  int? page;
  int? per_page;
  int? total;
  int? total_pages;
  List<UsersData>? data;
  UsersSupport? support;

  UsersResponse(
      {this.page,
        this.per_page,
        this.total,
        this.total_pages,
        this.data,
        this.support});

  factory UsersResponse.fromJson(Map<String, dynamic> json) => _$UsersResponseFromJson(json);
  Map<String, dynamic> toJson() => _$UsersResponseToJson(this);
}

@JsonSerializable()
class UsersData {
  int? id;
  String? email;
  String? first_name;
  String? last_name;
  String? avatar;

  UsersData({this.id, this.email, this.first_name, this.last_name, this.avatar});

  factory UsersData.fromJson(Map<String, dynamic> json) => _$UsersDataFromJson(json);
  Map<String, dynamic> toJson() => _$UsersDataToJson(this);
}

@JsonSerializable()
class UsersSupport {
  String? url;
  String? text;

  UsersSupport({this.url, this.text});

  factory UsersSupport.fromJson(Map<String, dynamic> json) => _$UsersSupportFromJson(json);
  Map<String, dynamic> toJson() => _$UsersSupportToJson(this);
}