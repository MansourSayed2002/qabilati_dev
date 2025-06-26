import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:qabilati/core/enum/type_file.dart';
import 'package:qabilati/core/function/upload_type_file.dart';
import 'package:qabilati/feature/chat_room/domain/usecase/send_message_and_upload_file_usecase.dart';
import 'package:qabilati/feature/chat_room/domain/usecase/send_message_usecase.dart';

part 'chat_room_state.dart';

class ChatRoomCubit extends Cubit<ChatRoomState> {
  ChatRoomCubit(this.sendMessageUsecase, this.sendMessageAndUploadFileUsecase)
    : super(ChatRoomInitial());

  late SendMessageUsecase sendMessageUsecase;
  late SendMessageAndUploadFileUsecase sendMessageAndUploadFileUsecase;
  TextEditingController textcontroller = TextEditingController();
  FocusNode focusNode = FocusNode();
  bool emoji = false;
  bool showFile = false;
  bool file = false;
  TypeFileEnum typefileenum = TypeFileEnum.text;
  List path = [];

  changeFile() {
    file = !file;
    file ? emit(FileTrue()) : emit(FileFalse());
  }

  void changeShowFileToTrue() {
    showFile = true;
    emit(ShowFileTrue());
  }

  void changeShowFileToFalse() {
    showFile = false;
    emit(ShowFileFalse());
  }

  void changeEmojiToTrue() {
    emoji = true;
    focusNode.unfocus();
    emit(EmojiTrue());
  }

  void changeEmojiToFalse() {
    emoji = false;
    emit(EmojiFalse());
  }

  Future<void> sendMessage(int chatRoomId) async {
    if (typefileenum == TypeFileEnum.text) {
      await sendMessageUsecase.sendMessage(textcontroller.text, chatRoomId);
    } else {
      for (dynamic e in path) {
        String content =
            "${bucketPathOfFile(typefileenum)}$chatRoomId/${e.toString().split("/").last.split("'").first}";
        await sendMessageAndUploadFileUsecase.sendMessageAndUploadFiles(
          typefileenum,
          content,
          chatRoomId,
          e,
        );
      }
      path.clear();
    }
  }
}
