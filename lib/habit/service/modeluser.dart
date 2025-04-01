import 'package:json_annotation/json_annotation.dart';

part 'modeluser.g.dart';

@JsonSerializable()
class Users {
  final String id;
  final String name;
  final String email;
  final String token;

  Users({
    required this.id,
    required this.name,
    required this.email,
    required this.token,
  });

  factory Users.fromJson(Map<String, dynamic> json) => _$UsersFromJson(json);
  Map<String, dynamic> toJson() => _$UsersToJson(this);
}