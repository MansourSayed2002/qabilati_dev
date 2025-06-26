// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notifi_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NotifiModel _$NotifiModelFromJson(Map<String, dynamic> json) => NotifiModel(
      notifiId: (json['notifiId'] as num?)?.toInt(),
      notifiSender: (json['notifiSender'] as num?)?.toInt(),
      notifiReceiver: (json['notifiReceiver'] as num?)?.toInt(),
      notifiType: (json['notifiType'] as num?)?.toInt(),
      notifiTitle: json['notifiTitle'] as String?,
      notifiContent: json['notifiContent'] as String?,
      image: json['image'] as String?,
    );

Map<String, dynamic> _$NotifiModelToJson(NotifiModel instance) =>
    <String, dynamic>{
      'notifiId': instance.notifiId,
      'notifiSender': instance.notifiSender,
      'notifiReceiver': instance.notifiReceiver,
      'notifiType': instance.notifiType,
      'notifiTitle': instance.notifiTitle,
      'notifiContent': instance.notifiContent,
      'image': instance.image,
    };
