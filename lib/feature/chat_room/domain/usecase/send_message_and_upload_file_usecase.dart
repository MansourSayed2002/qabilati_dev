import 'dart:developer';
import 'dart:io';

import 'package:qabilati/core/class/api_result.dart';
import 'package:qabilati/core/class/local_storage.dart';
import 'package:qabilati/core/enum/status_request.dart';
import 'package:qabilati/core/enum/type_file.dart';
import 'package:qabilati/core/function/upload_type_file.dart';
import 'package:qabilati/feature/chat_room/domain/repo_abs/chat_room_repo_abs.dart';

class SendMessageAndUploadFileUsecase {
  final ChatRoomRepoAbs chatRoomRepoAbs;
  SendMessageAndUploadFileUsecase(this.chatRoomRepoAbs);

  Future<ApiResult> sendMessageAndUploadFiles(
    TypeFileEnum typefile,
    String content,
    int roomChatId,
    File file,
  ) async {
    try {
      await chatRoomRepoAbs.sendMessage({
        "message_content": content,
        "message_sender": LocalStorageApp.getHiveData("user_data")['user_id'],
        "message_type": uploadTypeFile(typefile),
        "message_roomchat_id": roomChatId,
      });
      await chatRoomRepoAbs.uploadFiles(typefile, content, file);
      return ApiSuccess(StatusRequest.success);
    } catch (e) {
      log("error in upload file");
      log(e.toString());
      return ApiFailure(StatusRequest.failure);
    }
  }
}
