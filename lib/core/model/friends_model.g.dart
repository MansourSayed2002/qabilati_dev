// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'friends_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FriendsModel _$FriendsModelFromJson(Map<String, dynamic> json) => FriendsModel(
  friendid: (json['id'] as num?)?.toInt(),
  email: json['user_emailgoogle'] as String?,
  friendStatus: (json['friend_status'] as num?)?.toInt(),
  image: json['user_image'] as String?,
  phone: json['user_phone'] as String?,
  username: json['user_name'] as String?,
  uuid: json['user_uuid'] as String?,
  friendReplay: (json['friend_reply'] as num?)?.toInt(),
  friendRequest: (json['friend_request'] as num?)?.toInt(),
  userid: (json['user_id'] as num?)?.toInt(),
  token: json['user_token'] as String?,
);

Map<String, dynamic> _$FriendsModelToJson(FriendsModel instance) =>
    <String, dynamic>{
      'user_id': instance.userid,
      'id': instance.friendid,
      'user_name': instance.username,
      'user_emailgoogle': instance.email,
      'user_phone': instance.phone,
      'user_image': instance.image,
      'user_uuid': instance.uuid,
      'user_token': instance.token,
      'friend_Status': instance.friendStatus,
      'friend_Replay': instance.friendReplay,
      'friend_Request': instance.friendRequest,
    };
