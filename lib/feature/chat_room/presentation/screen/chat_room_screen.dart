import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qabilati/core/get_it/get_it.dart';
import 'package:qabilati/core/model/friends_model.dart';
import 'package:qabilati/core/shared/arrow_back_widget.dart';
import 'package:qabilati/feature/chat_room/presentation/cubit/chat_room_cubit.dart';
import 'package:qabilati/feature/chat_room/presentation/widget/message_screen_widget.dart';
import 'package:qabilati/feature/chat_room/presentation/widget/send_message_widget.dart';
import 'package:zego_uikit_prebuilt_call/zego_uikit_prebuilt_call.dart';

class ChatRoomScreen extends StatelessWidget {
  const ChatRoomScreen({
    super.key,
    required this.friend,
    required this.chatRoomId,
  });
  final FriendsModel friend;
  final int chatRoomId;
  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: getIt<ChatRoomCubit>(),
      child: Scaffold(
        appBar: AppBar(
          leading: ArrowBackWidget(),
          title: Text(
            friend.username.toString(),
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
          ),
          centerTitle: true,
          actions: [
            IconButton(
              onPressed: () {
                ZegoUIKitPrebuiltCallInvitationService().send(
                  resourceID: "mansourzegoapp",
                  invitees: [
                    ZegoCallUser(
                      friend.userid.toString(),
                      friend.username.toString(),
                    ),
                  ],
                  isVideoCall: false,
                );
              },
              icon: Icon(Icons.phone_outlined),
            ),
            IconButton(
              onPressed: () {
                ZegoUIKitPrebuiltCallInvitationService().send(
                  resourceID: "mansourzegoapp",
                  invitees: [
                    ZegoCallUser(
                      friend.userid.toString(),
                      friend.username.toString(),
                    ),
                  ],
                  isVideoCall: true,
                );
              },
              icon: Icon(CupertinoIcons.video_camera, size: 35.0),
            ),
          ],
        ),
        body: CustomBody(chatRoomId: chatRoomId),
      ),
    );
  }
}

class CustomBody extends StatelessWidget {
  const CustomBody({super.key, required this.chatRoomId});
  final int chatRoomId;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        MessageScreenWidget(chatRoomId: chatRoomId),
        SendMessageWidget(chatRoomId: chatRoomId),
      ],
    );
  }
}
