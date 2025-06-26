import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qabilati/core/extension/navigator_app.dart';
import 'package:qabilati/core/get_it/get_it.dart';
import 'package:qabilati/core/shared/arrow_back_widget.dart';
import 'package:qabilati/core/theme/color_app.dart';
import 'package:qabilati/feature/chat_room/presentation/widget/send_message_widget.dart';
import 'package:qabilati/feature/groub_chat/data/model/groubs_model.dart';
import 'package:qabilati/feature/groub_chat/presentation/cubit/groub_chat_cubit.dart';
import 'package:qabilati/feature/groub_chat/presentation/screen/info_group_screen.dart';
import 'package:qabilati/feature/groub_chat/presentation/widget/message_screen_groub_widget.dart';
import 'package:qabilati/generated/l10n.dart';

class RealtimeGroubChatScreen extends StatelessWidget {
  const RealtimeGroubChatScreen({super.key, required this.groub});
  final GroubsModel groub;
  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: getIt<GroubChatCubit>()..getGroupMembers(groub.id ?? 0),
      child: Scaffold(
        appBar: AppBar(
          leading: ArrowBackWidget(),
          title: Text(
            groub.name.toString(),
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
          ),
          centerTitle: true,
          actions: [
            PopupMenuButton(
              color: ColorApp.greymiddle,
              itemBuilder:
                  (context) => <PopupMenuItem>[
                    PopupMenuItem(
                      value: 1,
                      child: Text(S.of(context).groub_info),
                      onTap: () {
                        context.push(
                          InfoGroupScreen(
                            groub: groub,
                            membersGroup: getIt<GroubChatCubit>().groupMembers,
                          ),
                        );
                      },
                    ),
                    PopupMenuItem(
                      value: 2,
                      child: Text(S.of(context).media_groub),
                    ),

                    PopupMenuItem(
                      value: 3,
                      child: Text(
                        S.of(context).delete_groub,
                        style: TextStyle(color: ColorApp.red),
                      ),
                    ),
                  ],
            ),
          ],
        ),
        body: CustomBody(chatRoomId: groub.id!),
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
        MessageScreenGroubWidget(chatRoomId: chatRoomId),
        SendMessageWidget(chatRoomId: chatRoomId),
      ],
    );
  }
}
