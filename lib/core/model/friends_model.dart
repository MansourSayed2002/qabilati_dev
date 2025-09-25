import 'package:json_annotation/json_annotation.dart';
import 'package:qabilati/feature/auth/data/model/user_model.dart';

part 'friends_model.g.dart';

@JsonSerializable()
class FriendsModel {
  // @JsonKey(name: 'user_id')
  // int? userid;

  // @JsonKey(name: 'user_name')
  // String? username;
  // @JsonKey(name: 'user_emailgoogle')
  // String? email;
  // @JsonKey(name: 'user_phone')
  // String? phone;
  // @JsonKey(name: 'user_image')
  // String? image;
  // @JsonKey(name: 'user_uuid')
  // String? uuid;
  // @JsonKey(name: 'user_token')
  // String? token;
  @JsonKey(name: 'id')
  int? friendid;
  UserModel? userModel;
  @JsonKey(name: 'friend_status')
  int? friendStatus;
  @JsonKey(name: 'friend_reply')
  int? friendReplay;
  @JsonKey(name: 'friend_request')
  int? friendRequest;

  FriendsModel({
    this.userModel,
    this.friendReplay,
    this.friendRequest,
    this.friendStatus,
    this.friendid,
  });

  factory FriendsModel.fromJson(Map<String, dynamic> json) =>
      _$FriendsModelFromJson(json);

  Map<String, dynamic> toJson() => _$FriendsModelToJson(this);
}
