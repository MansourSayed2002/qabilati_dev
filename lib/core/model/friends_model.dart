import 'package:json_annotation/json_annotation.dart';
import 'package:qabilati/feature/auth/data/model/user_model.dart';

part 'friends_model.g.dart';

@JsonSerializable()
class FriendsModel {
  @JsonKey(name: 'user_uuid')
  String? uuid;
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
    this.uuid
  });

  factory FriendsModel.fromJson(Map<String, dynamic> json) =>
      _$FriendsModelFromJson(json);

  Map<String, dynamic> toJson() => _$FriendsModelToJson(this);
}
