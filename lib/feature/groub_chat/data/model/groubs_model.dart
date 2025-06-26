class GroubsModel {
  int? id;
  int? ownerId;
  String? name;
  String? image;
  String? uuid;

  GroubsModel({this.id, this.name, this.image});

  GroubsModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    ownerId = json['groub_owner'];
    name = json['groub_name'];
    image = json['groub_image'];
    uuid = json['group_uuid'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['groub_owner'] = ownerId;
    data['groub_name'] = name;
    data['groub_image'] = image;
    data['group_uuid'] = uuid;
    return data;
  }
}
