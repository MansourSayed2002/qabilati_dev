import 'package:hive_flutter/adapters.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user_model.g.dart';

@HiveType(typeId: 1)
@JsonSerializable()
class UserModel {
  @HiveField(0)
  int? id;
  @HiveField(1)
  String? uuid;
  @HiveField(2)
  String? email;
  @HiveField(3)
  String? username;
  @HiveField(4)
  String? phone;
  @HiveField(5)
  String? image;
  @HiveField(6)
  String? token;
  UserModel({
    this.id,
    this.email,
    this.username,
    this.phone,
    this.image,
    this.uuid,
    this.token,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);

  Map<String, dynamic> toJson() => _$UserModelToJson(this);
}
