class MemberGroupModel {
  int? id;
  int? memberId;
  String? name;
  String? phone;
  String? image;
  String? email;

  MemberGroupModel({
    this.id,
    this.memberId,
    this.name,
    this.phone,
    this.image,
    this.email,
  });

  MemberGroupModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    memberId = json['member_id'];
    name = json['user_name'];
    phone = json['user_phone'];
    image = json['user_image'];
    email = json['user_emailgoogle'];
  }
}
