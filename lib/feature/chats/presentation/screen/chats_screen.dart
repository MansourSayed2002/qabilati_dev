import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:qabilati/core/extension/navigator_app.dart';
import 'package:qabilati/core/get_it/get_it.dart';
import 'package:qabilati/core/model/friends_model.dart';
import 'package:qabilati/feature/chat_room/presentation/screen/chat_room_screen.dart';
import 'package:qabilati/feature/chats/presentation/cubit/chats_cubit.dart';
import 'package:qabilati/feature/chats/presentation/widget/buttom_tab_bar_widget.dart';

import 'package:qabilati/feature/chats/presentation/widget/card_chats_widget.dart';
import 'package:qabilati/generated/l10n.dart';

class ChatsScreen extends StatefulWidget {
  const ChatsScreen({super.key});

  @override
  State<ChatsScreen> createState() => _ChatsScreenState();
}

class _ChatsScreenState extends State<ChatsScreen> {
  List<Widget> screen = [CustomBodyChats(), CustomBodyCalls()];

  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: getIt<ChatsCubit>()..getChats(),
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.only(top: 13.0.w, left: 13.0.w, right: 13.0.h),
          child: Column(
            children: [
              Row(
                children: [
                  ButtomTabBarWidget(
                    index: 0,
                    currentIndex: currentIndex,
                    title: S.of(context).chats,
                    onTap: () {
                      setState(() {
                        currentIndex = 0;
                      });
                    },
                  ),
                  ButtomTabBarWidget(
                    index: 1,
                    currentIndex: currentIndex,
                    title: S.of(context).calls,
                    onTap: () {
                      setState(() {
                        currentIndex = 1;
                      });
                    },
                  ),
                ],
              ),
              Gap(10.0.h),
              Expanded(child: screen.elementAt(currentIndex)),
            ],
          ),
        ),
      ),
    );
  }
}

class CustomBodyChats extends StatelessWidget {
  const CustomBodyChats({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ChatsCubit, ChatsState>(
      builder: (context, state) {
        var cubit = getIt<ChatsCubit>();
        return ListView.separated(
          itemCount: cubit.chat.length,
          separatorBuilder: (context, index) => Gap(8.0.h),
          itemBuilder:
              (context, index) => CardChatsWidget(
                image: cubit.chat[index].image.toString(),
                title: cubit.chat[index].username.toString(),
                subtitle: cubit.chat[index].lastMessage.toString(),
                onTap: () {
                  context.push(
                    ChatRoomScreen(
                      friend: FriendsModel(
                        userid: cubit.chat[index].userid,
                        email: cubit.chat[index].email,
                        phone: cubit.chat[index].phone,
                        image: cubit.chat[index].image,
                        token: cubit.chat[index].token,
                        username: cubit.chat[index].username,
                        uuid: cubit.chat[index].uuid,
                      ),
                      chatRoomId: cubit.chat[index].chatId ?? 0,
                    ),
                  );
                },
              ),
        );
      },
    );
  }
}

class CustomBodyCalls extends StatelessWidget {
  const CustomBodyCalls({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(child: Text("Calls"));
  }
}
