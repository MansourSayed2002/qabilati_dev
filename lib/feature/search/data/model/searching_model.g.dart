// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'searching_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SearchingModel _$SearchingModelFromJson(Map<String, dynamic> json) =>
    SearchingModel(
      id: (json['id'] as num?)?.toInt(),
      email: json['email'] as String?,
      friendStatus: (json['friendStatus'] as num?)?.toInt(),
      image: json['image'] as String?,
      phone: json['phone'] as String?,
      username: json['username'] as String?,
      uuid: json['uuid'] as String?,
      friendReplay: (json['friendReplay'] as num?)?.toInt(),
      friendRequest: (json['friendRequest'] as num?)?.toInt(),
      userid: (json['userid'] as num?)?.toInt(),
    );

Map<String, dynamic> _$SearchingModelToJson(SearchingModel instance) =>
    <String, dynamic>{
      'userid': instance.userid,
      'id': instance.id,
      'username': instance.username,
      'email': instance.email,
      'phone': instance.phone,
      'image': instance.image,
      'uuid': instance.uuid,
      'friendStatus': instance.friendStatus,
      'friendReplay': instance.friendReplay,
      'friendRequest': instance.friendRequest,
    };
