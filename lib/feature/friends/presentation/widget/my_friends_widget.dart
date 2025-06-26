import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:qabilati/core/extension/navigator_app.dart';
import 'package:qabilati/core/function/loading_widget.dart';
import 'package:qabilati/core/get_it/get_it.dart';
import 'package:qabilati/core/model/friends_model.dart';
import 'package:qabilati/core/shared/net_work_image_widget.dart';
import 'package:qabilati/core/theme/color_app.dart';
import 'package:qabilati/core/theme/textstyle_app.dart';
import 'package:qabilati/feature/chat_room/presentation/screen/chat_room_screen.dart';
import 'package:qabilati/feature/friends/presentation/cubit/friend_cubit.dart';
import 'package:qabilati/generated/l10n.dart';

class MyFriendsWidget extends StatelessWidget {
  const MyFriendsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: 8.0.w, vertical: 8.0.h),
          width: double.infinity,
          color: ColorApp.grey,
          child: Text(S.of(context).my_friends, style: getSmallStyle()),
        ),
        Gap(10.0.h),
        BlocConsumer<FriendsCubit, FriendsState>(
          listener: (context, state) {
            if (state is ChatRoomSuccess) {
              context.pop();
              context.push(
                ChatRoomScreen(
                  chatRoomId: state.chatRoomId,
                  friend: state.friend,
                ),
              );
            } else if (state is ChatRoomLoading) {
              loadingWidget(context);
            }
          },
          builder: (context, state) {
            var cubit = getIt<FriendsCubit>();
            return ListView.separated(
              shrinkWrap: true,
              itemCount: cubit.friendList.length,
              physics: NeverScrollableScrollPhysics(),
              separatorBuilder: (context, index) => Gap(10.0.h),
              itemBuilder: (context, index) {
                FriendsModel friends = FriendsModel.fromJson(
                  cubit.friendList[index],
                );
                return CardFriend(friends: friends, cubit: cubit);
              },
            );
          },
        ),
      ],
    );
  }
}

class CardFriend extends StatelessWidget {
  const CardFriend({super.key, required this.friends, required this.cubit});
  final FriendsModel friends;
  final FriendsCubit cubit;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 17.0.w),
      child: InkWell(
        onTap: () {
          print("object");
        },
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(5.0.r),
              child: NetWorkImageWidget(
                width: 60.0.w,
                height: 60.0.h,
                fit: BoxFit.cover,
                image: "${dotenv.env['SUPABASE_URL_IMAGE']}${friends.image}",
              ),
            ),
            Gap(10.0.h),
            Expanded(
              child: Text(
                friends.username.toString(),
                style: getBodyStyle(context: context),
              ),
            ),
            InkWell(
              onTap: () {
                cubit.selectChatRoom(
                  friends.friendRequest!,
                  friends.friendReplay!,
                  friends,
                );
              },
              child: SizedBox(
                width: 50.0.w,
                height: 50.0.h,
                child: Icon(
                  CupertinoIcons.chat_bubble_2_fill,
                  color: Colors.green,
                  size: 35.0,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
