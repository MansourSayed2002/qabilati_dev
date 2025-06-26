import 'dart:developer';
import 'package:qabilati/core/class/api_result.dart';
import 'package:qabilati/core/class/local_storage.dart';
import 'package:qabilati/core/enum/status_request.dart';
import 'package:qabilati/feature/chat_room/domain/repo_abs/chat_room_repo_abs.dart';

class SendMessageUsecase {
  final ChatRoomRepoAbs chatRoomRepoAbs;
  SendMessageUsecase(this.chatRoomRepoAbs);

  Future<ApiResult> sendMessage(dynamic content, int roomChatId) async {
    try {
      await chatRoomRepoAbs.sendMessage({
        "message_content": content,
        "message_sender": LocalStorageApp.getHiveData("user_data")['user_id'],
        "message_type": 0,
        "message_roomchat_id": roomChatId,
      });
      return ApiSuccess(StatusRequest.success);
    } catch (e) {
      log(e.toString());
      return ApiFailure(StatusRequest.failure);
    }
  }
}
