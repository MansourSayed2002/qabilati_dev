import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qabilati/core/extension/navigator_app.dart';
import 'package:qabilati/core/theme/color_app.dart';
import 'package:qabilati/core/theme/textstyle_app.dart';
import 'package:qabilati/feature/friends/presentation/screen/request_friend_screen.dart';
import 'package:qabilati/feature/groub_chat/presentation/screen/groub_chat_screen.dart';
import 'package:qabilati/generated/l10n.dart';

class CardsShips extends StatelessWidget {
  const CardsShips({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 17.0.w),
      child: Column(
        children: [
          Cardships(
            cardColor: Colors.amber.shade700,
            title: S.of(context).friend_request,
            iconData: Icons.person_add_alt_1_sharp,
            onTap: () {
              context.push(RequestFriendScreen());
            },
          ),
          Cardships(
            cardColor: Colors.amber.shade400,
            title: S.of(context).chat_only_friend,
            iconData: CupertinoIcons.chat_bubble_fill,
            onTap: () {},
          ),
          Cardships(
            cardColor: Colors.green,
            title: S.of(context).groub_chats,
            iconData: CupertinoIcons.group_solid,
            onTap: () {
              context.push(GroubChatScreen());
            },
          ),
        ],
      ),
    );
  }
}

class Cardships extends StatelessWidget {
  const Cardships({
    super.key,
    required this.title,
    required this.onTap,
    required this.iconData,
    required this.cardColor,
  });
  final String title;
  final VoidCallback onTap;
  final IconData iconData;
  final Color cardColor;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 8.0.h),
        child: Row(
          spacing: 10.0.w,
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 7.0.w, vertical: 7.0.h),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0.r),
                color: cardColor,
              ),
              child: Icon(iconData, size: 35.0, color: ColorApp.white),
            ),
            Text(
              title,
              style: getBodyStyle(context: context, fontSize: 18.0.sp),
            ),
          ],
        ),
      ),
    );
  }
}
