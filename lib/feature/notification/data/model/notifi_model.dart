import 'package:json_annotation/json_annotation.dart';

part "notifi_model.g.dart";

@JsonSerializable()
class NotifiModel {
  int? notifiId;
  int? notifiSender;
  int? notifiReceiver;
  int? notifiType;
  String? notifiTitle;
  String? notifiContent;
  String? image;

  NotifiModel({
    this.notifiId,
    this.notifiSender,
    this.notifiReceiver,
    this.notifiType,
    this.notifiTitle,
    this.notifiContent,
    this.image,
  });

  factory NotifiModel.fromJson(Map<String, dynamic> json) =>
      _$NotifiModelFromJson(json);

  Map<String, dynamic> toJson() => _$NotifiModelToJson(this);
}
