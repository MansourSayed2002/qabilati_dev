class PostModel {
  int? postId;
  int? postOwner;
  String? postContent;
  int? postType;
  List<String>? images;
  String? userImage;
  String? userName;
  String? userEmailgoogle;
  String? userPhone;
  String? userUuid;
  String? createdAt;

  PostModel({
    this.postId,
    this.postOwner,
    this.postContent,
    this.postType,
    this.images,
    this.userImage,
    this.userName,
    this.userEmailgoogle,
    this.userPhone,
    this.userUuid,
    this.createdAt,
  });

  PostModel.fromJson(Map<String, dynamic> json) {
    postId = json['id'];
    postOwner = json['post_owner'];
    postContent = json['post_content'];
    postType = json['post_type'];
    if (json['images'] != null) {
      images = List<String>.from(json['images']);
    }
    userImage = json['user_image'];
    userName = json['user_name'];
    userEmailgoogle = json['user_emailgoogle'];
    userPhone = json['user_phone'];
    userUuid = json['user_uuid'];
    createdAt = json['created_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = postId;
    data['post_owner'] = postOwner;
    data['post_content'] = postContent;
    data['post_type'] = postType;
    if (images != null) {
      data['image'] = images;
    }
    data['user_image'] = userImage;
    data['user_name'] = userName;
    data['user_emailgoogle'] = userEmailgoogle;
    data['user_phone'] = userPhone;
    data['user_uuid'] = userUuid;
    data['created_at'] = createdAt;
    return data;
  }
}
