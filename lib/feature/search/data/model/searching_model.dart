import 'package:json_annotation/json_annotation.dart';

part 'searching_model.g.dart';

@JsonSerializable()
class SearchingModel {
  int? userid;
  int? id;
  String? username;
  String? email;
  String? phone;
  String? image;
  String? uuid;
  int? friendStatus;
  int? friendReplay;
  int? friendRequest;

  SearchingModel({
    this.id,
    this.email,
    this.friendStatus,
    this.image,
    this.phone,
    this.username,
    this.uuid,
    this.friendReplay,
    this.friendRequest,
    this.userid,
  });

  factory SearchingModel.fromJson(Map<String, dynamic> json) =>
      _$SearchingModelFromJson(json);

  Map<String, dynamic> toJson() => _$SearchingModelToJson(this);
}
