// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'message_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MessageModel _$MessageModelFromJson(Map<String, dynamic> json) => MessageModel(
  chatroomid: (json['message_chatroom_id'] as num?)?.toInt(),
  createdAt: json['created_at'] as String?,
  messagecontent: json['message_content'] as String?,
  messageid: (json['message_id'] as num?)?.toInt(),
  messagesender: (json['message_sender'] as num?)?.toInt(),
  messagetype: (json['message_type'] as num?)?.toInt(),
  messagevisibility: (json['message_visibility'] as num?)?.toInt(),
);

Map<String, dynamic> _$MessageModelToJson(MessageModel instance) =>
    <String, dynamic>{
      'message_id': instance.messageid,
      'message_content': instance.messagecontent,
      'message_visibility': instance.messagevisibility,
      'message_sender': instance.messagesender,
      'message_chatroom_id': instance.chatroomid,
      'message_type': instance.messagetype,
      'created_at': instance.createdAt,
    };
