class ChatsModel {
  int? userid;
  int? chatId;
  int? chatUserId1;
  int? chatUserId2;
  int? lastMessageType;
  String? username;
  String? email;
  String? phone;
  String? image;
  String? uuid;
  String? token;
  String? lastMessage;
  String? lastMessageTime;

  ChatsModel(
    this.chatId,
    this.chatUserId1,
    this.chatUserId2,
    this.email,
    this.image,
    this.lastMessage,
    this.lastMessageTime,
    this.lastMessageType,
    this.phone,
    this.token,
    this.userid,
    this.username,
    this.uuid,
  );

  ChatsModel.fromJson(Map<String, dynamic> json) {
    chatId = json['chat_id'];
    userid = json['user_id'];
    chatUserId1 = json['chat_user1'];
    chatUserId2 = json['chat_user2'];
    email = json['user_emailgoogle'];
    phone = json['user_phone'];
    image = json['user_image'];
    token = json['user_token'];
    username = json['user_name'];
    uuid = json['user_uuid'];
    lastMessage = json['last_message'];
    lastMessageType = json['last_message_type'];
    lastMessageTime = json['last_message_time'];
  }
}
