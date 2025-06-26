class MessageSenderModel {
  int? messageId;
  int? messageSenderId;
  String? messageSenderName;
  String? messageSenderImage;
  String? messageSenderPhone;
  String? messageSenderEmail;
  String? messageContent;
  int? messageVisibility;
  int? chatRoomId;
  int? messageType;
  String? messageTime;

  MessageSenderModel({
    this.messageId,
    this.messageSenderId,
    this.messageSenderName,
    this.messageSenderImage,
    this.messageSenderPhone,
    this.messageSenderEmail,
    this.messageContent,
    this.messageVisibility,
    this.chatRoomId,
    this.messageType,
    this.messageTime,
  });

  MessageSenderModel.fromjson(Map<String, dynamic> json) {
    messageId = json['message_id'];
    messageSenderId = json['message_sender'];
    messageSenderName = json['user_name'];
    messageSenderImage = json['user_image'];
    messageSenderPhone = json['user_phone'];
    messageSenderEmail = json['user_emailgoogle'];
    messageContent = json['message_content'];
    messageVisibility = json['message_visibility'];
    chatRoomId = json['message_roomchat_id'];
    messageType = json['message_type'];
    messageTime = json['message_created_at'];
  }
}
