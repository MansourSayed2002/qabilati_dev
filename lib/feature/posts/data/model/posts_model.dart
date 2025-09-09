class PostsModel {
  int? postId;
  int? postOwner;
  int? imagePostId;
  String? postText;
  int? postType;
  String? postImage;
  String? postTime;
  String? userImage;
  String? userName;
  String? userEmail;
  String? userPhone;
  String? userUuid;

  PostsModel({
    this.postId,
    this.postOwner,
    this.imagePostId,
    this.postText,
    this.postType,
    this.postImage,
    this.postTime,
    this.userImage,
    this.userName,
    this.userEmail,
    this.userPhone,
    this.userUuid,
  });

  PostsModel.fromJson(Map<String, dynamic> json) {
    postId = json['post_id'];
    postOwner = json['post_owner'];
    imagePostId = json['image_post_id'];
    postText = json['post_content'];
    postType = json['post_type'];
    postImage = json['image'];
    postTime = json['created_at'];
    userImage = json['user_image'];
    userName = json['user_name'];
    userEmail = json['user_emailgoogle'];
    userPhone = json['user_phone'];
    userUuid = json['user_uuid'];
  }

  toJson(PostsModel postsModel) => {
    'post_id': postsModel.postId,
    'post_owner': postsModel.postOwner,
    'image_post_id': postsModel.imagePostId,
    'post_content': postsModel.postText,
    'post_type': postsModel.postType,
    'image': postsModel.postImage,
    'created_at': postsModel.postTime,
    'user_image': postsModel.userImage,
    'user_name': postsModel.userName,
    'user_emailgoogle': postsModel.userEmail,
    'user_phone': postsModel.userPhone,
    'user_uuid': postsModel.userUuid,
  };
}
