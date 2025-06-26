import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:qabilati/core/enum/type_file.dart';
import 'package:qabilati/core/get_it/get_it.dart';
import 'package:qabilati/core/shared/custom_text_from_global.dart';
import 'package:qabilati/core/theme/textstyle_app.dart';
import 'package:qabilati/feature/chat_room/presentation/cubit/chat_room_cubit.dart';
import 'package:qabilati/feature/chat_room/presentation/widget/emoji_widget.dart';
import 'package:qabilati/feature/chat_room/presentation/widget/recorder_widget.dart';
import 'package:qabilati/feature/chat_room/presentation/widget/send_different_types_of_file.dart';
import 'package:qabilati/feature/chat_room/presentation/widget/show_file_widget.dart';
import 'package:qabilati/generated/l10n.dart';

class SendMessageWidget extends StatelessWidget {
  const SendMessageWidget({super.key, required this.chatRoomId});
  final int chatRoomId;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ShowFileWidget(),
        SendDifferentTypesOfFile(),
        Row(
          children: [
            TextButton(
              onPressed: () {
                getIt<ChatRoomCubit>().sendMessage(chatRoomId);
                getIt<ChatRoomCubit>().changeShowFileToFalse();
                getIt<ChatRoomCubit>().textcontroller.clear();
              },
              child: Text(
                S.of(context).send,
                style: getBodyStyle(context: context, color: Colors.blueAccent),
              ),
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 8.0.w,
                  vertical: 8.0.h,
                ),
                child: CustomTextFormGlobal(
                  onTap: () {
                    getIt<ChatRoomCubit>().typefileenum = TypeFileEnum.text;
                    getIt<ChatRoomCubit>().changeEmojiToFalse();
                  },
                  controller: getIt<ChatRoomCubit>().textcontroller,
                  focusNode: getIt<ChatRoomCubit>().focusNode,
                  hinttext: "",
                  prefixIcon: IconButton(
                    onPressed: () {
                      getIt<ChatRoomCubit>().changeEmojiToTrue();
                    },
                    icon: Icon(Icons.tag_faces_outlined, size: 35.0),
                  ),
                ),
              ),
            ),
            RecorderWidget(chatRoomId: chatRoomId),
            IconButton(
              onPressed: () {
                getIt<ChatRoomCubit>().changeFile();
              },
              icon: Icon(Icons.add_circle_outline),
            ),
            Gap(8.0.w),
          ],
        ),
        EmojiWidget(),
      ],
    );
  }
}
