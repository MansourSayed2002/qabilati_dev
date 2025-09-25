// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'message_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MessageModel _$MessageModelFromJson(Map<String, dynamic> json) => MessageModel(
      chatroomid: (json['chatroomid'] as num?)?.toInt(),
      createdAt: json['createdAt'] as String?,
      messagecontent: json['messagecontent'] as String?,
      messageid: (json['messageid'] as num?)?.toInt(),
      messagesender: (json['messagesender'] as num?)?.toInt(),
      messagetype: (json['messagetype'] as num?)?.toInt(),
      messagevisibility: (json['messagevisibility'] as num?)?.toInt(),
    );

Map<String, dynamic> _$MessageModelToJson(MessageModel instance) =>
    <String, dynamic>{
      'messageid': instance.messageid,
      'messagecontent': instance.messagecontent,
      'messagevisibility': instance.messagevisibility,
      'messagesender': instance.messagesender,
      'chatroomid': instance.chatroomid,
      'messagetype': instance.messagetype,
      'createdAt': instance.createdAt,
    };
