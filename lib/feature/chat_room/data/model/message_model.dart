import 'package:json_annotation/json_annotation.dart';

part 'message_model.g.dart';

@JsonSerializable()
class MessageModel {
  int? messageid;
  String? messagecontent;
  int? messagevisibility;
  int? messagesender;
  int? chatroomid;
  int? messagetype;
  String? createdAt;

  MessageModel({
    this.chatroomid,
    this.createdAt,
    this.messagecontent,
    this.messageid,
    this.messagesender,
    this.messagetype,
    this.messagevisibility,
  });

  factory MessageModel.fromJson(Map<String, dynamic> json) =>
      _$MessageModelFromJson(json);

  Map<String, dynamic> toJson() => _$MessageModelToJson(this);
}
