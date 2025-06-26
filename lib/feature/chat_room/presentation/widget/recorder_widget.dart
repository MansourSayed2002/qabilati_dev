import 'dart:io';

import 'package:flutter/material.dart';
import 'package:qabilati/core/class/voices_kit.dart';
import 'package:qabilati/core/enum/type_file.dart';
import 'package:qabilati/core/get_it/get_it.dart';
import 'package:qabilati/feature/chat_room/presentation/cubit/chat_room_cubit.dart';

class RecorderWidget extends StatefulWidget {
  const RecorderWidget({super.key, required this.chatRoomId});
  final int chatRoomId;
  @override
  State<RecorderWidget> createState() => _RecorderWidgetState();
}

class _RecorderWidgetState extends State<RecorderWidget> {
  bool isrecord = false;

  @override
  void dispose() {
    VoicesKit.instance.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () async {
        if (isrecord == true) {
          final String? path = await VoicesKit.instance.stopRecording();
          getIt<ChatRoomCubit>().path.add(File(path!));
          getIt<ChatRoomCubit>().typefileenum = TypeFileEnum.record;
          await getIt<ChatRoomCubit>().sendMessage(widget.chatRoomId);
          setState(() {
            isrecord = false;
          });
        } else {
          await VoicesKit.instance.startRecording(widget.chatRoomId);
          setState(() {
            isrecord = true;
          });
        }
      },
      icon:
          isrecord == true
              ? Icon(Icons.stop)
              : Icon(Icons.keyboard_voice_outlined),
    );
  }
}
