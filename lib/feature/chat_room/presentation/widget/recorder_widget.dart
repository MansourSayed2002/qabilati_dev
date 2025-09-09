import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qabilati/core/class/voices_kit.dart';
import 'package:qabilati/core/enum/type_file.dart';
import 'package:qabilati/core/get_it/get_it.dart';
import 'package:qabilati/feature/chat_room/presentation/cubit/chat_room_cubit.dart';

class RecorderWidget extends StatelessWidget {
  const RecorderWidget({super.key, required this.chatRoomId});
  final int chatRoomId;

  @override
  Widget build(BuildContext context) {
    var record = context.select(
      (ChatRoomCubit chatRoomCubit) => chatRoomCubit.isRecord,
    );
    return IconButton(
      onPressed: () async {
        if (record == true) {
          final String? path = await VoicesKit.instance.stopRecording();
          getIt<ChatRoomCubit>().path.add(File(path!));
          getIt<ChatRoomCubit>().typefileenum = TypeFileEnum.record;
          await getIt<ChatRoomCubit>().sendMessage(chatRoomId);
          getIt<ChatRoomCubit>().toggleRecord();
        } else {
          await VoicesKit.instance.startRecording(chatRoomId);
          getIt<ChatRoomCubit>().toggleRecord();
        }
      },
      icon:
          record == true
              ? Icon(Icons.stop)
              : Icon(Icons.keyboard_voice_outlined),
    );
  }
}
