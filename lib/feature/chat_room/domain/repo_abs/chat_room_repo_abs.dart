import 'dart:io';

import 'package:qabilati/core/enum/type_file.dart';

abstract class ChatRoomRepoAbs {
  Future sendMessage(Map<String, dynamic> data);
  Future uploadFiles(TypeFileEnum typeFile, String path, File file);
}
