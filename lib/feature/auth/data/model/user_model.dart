import 'package:hive_flutter/adapters.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user_model.g.dart';

@HiveType(typeId: 1)
@JsonSerializable()
class UserModel {
  @HiveField(0)
  @JsonKey(name: 'user_id')
  int? id;
  @HiveField(1)
  @JsonKey(name: 'user_emailgoogle')
  String? email;
  @HiveField(2)
  @JsonKey(name: 'user_name')
  String? username;
  @HiveField(3)
  @JsonKey(name: 'user_phone')
  String? phone;
  @HiveField(4)
  @JsonKey(name: 'user_image')
  String? image;
  @HiveField(5)
  @JsonKey(name: 'user_token')
  String? token;
  @HiveField(6)
  @JsonKey(name: 'active_wallet')
  bool? isActiveWallet;
  UserModel({
    this.id,
    this.email,
    this.username,
    this.phone,
    this.image,
    this.token,
    this.isActiveWallet,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);

  Map<String, dynamic> toJson() => _$UserModelToJson(this);
}
