import 'dart:io';
import 'package:qabilati/core/enum/type_file.dart';
import 'package:qabilati/core/function/upload_type_file.dart';
import 'package:qabilati/feature/chat_room/data/api/chat_room_api.dart';
import 'package:qabilati/feature/chat_room/domain/repo_abs/chat_room_repo_abs.dart';

class ChatRoomRepoImp extends ChatRoomRepoAbs {
  @override
  Future sendMessage(Map<String, dynamic> data) async {
    await ChatRoomApi.insert("message", data);
  }

  @override
  Future uploadFiles(TypeFileEnum typeFile, String path, File file) async {
    await ChatRoomApi.uploadFile(bucketOfTypeFile(typeFile), path, file);
  }
}
