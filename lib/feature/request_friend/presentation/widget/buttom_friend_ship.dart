import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qabilati/core/class/local_storage.dart';
import 'package:qabilati/core/class/notifications_app.dart';
import 'package:qabilati/core/extension/dialog_app.dart';
import 'package:qabilati/core/extension/message_bar.dart';
import 'package:qabilati/core/extension/navigator_app.dart';
import 'package:qabilati/core/function/loading_widget.dart';
import 'package:qabilati/core/get_it/get_it.dart';
import 'package:qabilati/core/model/friends_model.dart';
import 'package:qabilati/core/theme/color_app.dart';
import 'package:qabilati/feature/request_friend/presentation/cubit/request_friend_cubit.dart';
import 'package:qabilati/feature/request_friend/presentation/widget/buttom_request_friend.dart';
import 'package:qabilati/generated/l10n.dart';

class ButtomFriendShip extends StatelessWidget {
  const ButtomFriendShip({super.key, required this.user});

  final FriendsModel user;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RequestFriendCubit, RequestFriendState>(
      listener: (context, state) {
        if (state is RequestFriendSuccess) {
          context.pop();
          user.friendStatus = state.data["friend_status"];
          user.userid = state.data["id"];
          user.friendReplay = state.data["friend_reply"];
          user.friendRequest = state.data["friend_request"];
          log(user.friendReplay.toString());
          NotificationsApp.sendNotification(
            token:
                "dNFMZbDDQnyAt1hg1z_1O_:APA91bFBlL3Mjoh81nLHrSNq3R4WcSq88DFrYHZkdzLSpt6p2MsXlFNy9RAhQnXoxFIdvtxHJwqkWvIj_NFqwGUaAjw90yfYjNijbow3EcBuZ6lfCozYsJg",
            title: S.of(context).friend_request,
            body:
                "${S.of(context).send_to_you} ${LocalStorageApp.getHiveData("user_data")['user_name']} ${S.of(context).friend_request}",
            receiver: user.friendReplay ?? 0,
          );
        } else if (state is SuccessUnfriend) {
          context.pop();
          user.friendStatus = 3;
        } else if (state is RequestFriendError) {
          context.pop();
          context.messageBar(S.of(context).message_error);
        } else if (state is RequestFriendLoading) {
          loadingWidget(context);
        }
      },
      builder: (context, state) {
        var cubit = getIt<RequestFriendCubit>();
        return user.friendStatus == 1
            ? ButtomRequestFriend(
              color: ColorApp.greyDa,
              title: S.of(context).friends,
              icon: Icons.group_rounded,
              onTap: () {
                context.dialogApp(
                  title: S.of(context).cancel_friend,
                  content: S.of(context).cancel_friend_body,
                  onCancel: () {
                    context.pop();
                  },
                  onConfirme: () {
                    context.pop();
                    cubit.unFriend(user.userid!);
                  },
                );
              },
            )
            : user.friendStatus == 0
            ? ButtomRequestFriend(
              color: Colors.amber,
              title: S.of(context).pending,
              icon: Icons.pending,
              onTap: () {
                context.dialogApp(
                  title: S.of(context).cancel_order,
                  content: S.of(context).cancel_order_body,
                  onCancel: () {
                    context.pop();
                  },
                  onConfirme: () {
                    context.pop();
                    cubit.unFriend(user.userid!);
                  },
                );
              },
            )
            : ButtomRequestFriend(
              color: Colors.green,
              title: S.of(context).friend_request,
              icon: Icons.group_add_rounded,
              onTap: () {
                context.pop();
                cubit.requestFriend(user.userid!);
              },
            );
      },
    );
  }
}
