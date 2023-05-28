import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_credentials.g.dart';

@JsonSerializable()
class UserCredentials {
  final String username;
  final String password;
  final String? firstname;
  final String? lastname;

  const UserCredentials({
    required this.username,
    required this.password,
    this.firstname,
    this.lastname,
  });

  factory UserCredentials.fromJson(Map<String, dynamic> json) => _$UserCredentialsFromJson(json);

  Map<String, dynamic> toJson() => _$UserCredentialsToJson(this);
}