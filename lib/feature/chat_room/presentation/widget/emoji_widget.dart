import 'dart:io';
import 'package:emoji_picker_flutter/emoji_picker_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qabilati/core/get_it/get_it.dart';
import 'package:qabilati/feature/chat_room/presentation/cubit/chat_room_cubit.dart';

class EmojiWidget extends StatelessWidget {
  const EmojiWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ChatRoomCubit, ChatRoomState>(
      buildWhen:
          (previous, current) => current is EmojiTrue || current is EmojiFalse,
      builder: (context, state) {
        if (state is EmojiTrue) {
          return SizedBox(
            height: 300.0.h,
            child: EmojiPicker(
              textEditingController: getIt<ChatRoomCubit>().textcontroller,
              config: Config(
                height: 256.h,
                checkPlatformCompatibility: true,
                emojiViewConfig: EmojiViewConfig(
                  emojiSizeMax: 28 * (Platform.isIOS ? 1.20 : 1.0),
                ),
                viewOrderConfig: const ViewOrderConfig(
                  top: EmojiPickerItem.categoryBar,
                  middle: EmojiPickerItem.emojiView,
                  bottom: EmojiPickerItem.searchBar,
                ),
                bottomActionBarConfig: const BottomActionBarConfig(
                  enabled: false,
                ),
              ),
            ),
          );
        } else {
          return SizedBox.shrink();
        }
      },
    );
  }
}
