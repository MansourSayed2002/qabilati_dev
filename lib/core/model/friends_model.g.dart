// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'friends_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FriendsModel _$FriendsModelFromJson(Map<String, dynamic> json) => FriendsModel(
  userModel: UserModel(
    id: json['user_id'] as int?,
    email: json['user_emailgoogle'] as String?,
    username: json['user_name'] as String?,
    phone: json['user_phone'] as String?,
    image: json['user_image'] as String?,
  ),
  friendReplay: (json['friend_reply'] as num?)?.toInt(),
  friendRequest: (json['friend_request'] as num?)?.toInt(),
  friendStatus: (json['friend_status'] as num?)?.toInt(),
  friendid: (json['id'] as num?)?.toInt(),
  uuid: json['user_uuid'] as String?,
);

Map<String, dynamic> _$FriendsModelToJson(FriendsModel instance) =>
    <String, dynamic>{
      'user_uuid': instance.uuid,
      'id': instance.friendid,
      'user_id': instance.userModel?.id,
      'user_emailgoogle': instance.userModel?.email,
      'user_name': instance.userModel?.username,
      'user_phone': instance.userModel?.phone,
      'user_image': instance.userModel?.image,
      'friend_status': instance.friendStatus,
      'friend_reply': instance.friendReplay,
      'friend_request': instance.friendRequest,
    };
