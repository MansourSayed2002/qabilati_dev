import 'package:json_annotation/json_annotation.dart';

part 'friends_model.g.dart';

@JsonSerializable()
class FriendsModel {
  int? userid;
  int? friendid;
  String? username;
  String? email;
  String? phone;
  String? image;
  String? uuid;
  String? token;
  int? friendStatus;
  int? friendReplay;
  int? friendRequest;

  FriendsModel({
    this.friendid,
    this.email,
    this.friendStatus,
    this.image,
    this.phone,
    this.username,
    this.uuid,
    this.friendReplay,
    this.friendRequest,
    this.userid,
    this.token,
  });

  factory FriendsModel.fromJson(Map<String, dynamic> json) =>
      _$FriendsModelFromJson(json);

  Map<String, dynamic> toJson() => _$FriendsModelToJson(this);
}
