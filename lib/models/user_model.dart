// To parse this JSON data, do
//
//     final userModel = userModelFromJson(jsonString);

import 'dart:convert';

UserModel userModelFromJson(String str) => UserModel.fromJson(json.decode(str));

String userModelToJson(UserModel data) => json.encode(data.toJson());

class UserModel {
  UserModel({
    this.id,
    this.name,
    this.email,
    this.username,
    this.phone,
    this.roles,
    this.emailVerifiedAt,
    this.currentTeamId,
    this.profilePhotoPath,
    this.createdAt,
    this.updatedAt,
    this.accessToken,
    this.profilePhotoUrl,
  });

  int? id;
  String? name;
  String? email;
  String? username;
  String? phone;
  String? roles;
  dynamic emailVerifiedAt;
  dynamic currentTeamId;
  dynamic profilePhotoPath;
  DateTime? createdAt;
  DateTime? updatedAt;
  String? accessToken;
  String? profilePhotoUrl;

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        id: json["id"],
        name: json["name"],
        email: json["email"],
        username: json["username"],
        phone: json["phone"],
        roles: json["roles"],
        emailVerifiedAt: json["email_verified_at"],
        currentTeamId: json["current_team_id"],
        profilePhotoPath: json["profile_photo_path"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        accessToken: json["access_token"],
        profilePhotoUrl: json["profile_photo_url"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "email": email,
        "username": username,
        "phone": phone,
        "roles": roles,
        "email_verified_at": emailVerifiedAt,
        "current_team_id": currentTeamId,
        "profile_photo_path": profilePhotoPath,
        "created_at": createdAt!.toIso8601String(),
        "updated_at": updatedAt!.toIso8601String(),
        "access_token": accessToken,
        "profile_photo_url": profilePhotoUrl,
      };
}
