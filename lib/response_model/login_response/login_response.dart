
import 'package:json_annotation/json_annotation.dart';
part 'login_response.g.dart';


@JsonSerializable()
class LoginResponse {
  int? page;
  int? per_page;
  int? total;
  int? total_pages;
  List<LoginData>? data;
  Support? support;

  LoginResponse(
      {this.page,
        this.per_page,
        this.total,
        this.total_pages,
        this.data,
        this.support});

  factory LoginResponse.fromJson(Map<String, dynamic> json) => _$LoginResponseFromJson(json);
  Map<String, dynamic> toJson() => _$LoginResponseToJson(this);
}

@JsonSerializable()

class LoginData {
  int? id;
  String? name;
  int? year;
  String? color;
  String? pantone_value;

  LoginData({this.id, this.name, this.year, this.color, this.pantone_value});

  factory LoginData.fromJson(Map<String, dynamic> json) => _$LoginDataFromJson(json);
  Map<String, dynamic> toJson() => _$LoginDataToJson(this);
}

@JsonSerializable()

class Support {
  String? url;
  String? text;

  Support({this.url, this.text});

  factory Support.fromJson(Map<String, dynamic> json) => _$SupportFromJson(json);
  Map<String, dynamic> toJson() => _$SupportToJson(this);
}