import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:qabilati/core/extension/navigator_app.dart';
import 'package:qabilati/core/model/friends_model.dart';
import 'package:qabilati/core/shared/net_work_image_widget.dart';
import 'package:qabilati/core/theme/textstyle_app.dart';
import 'package:qabilati/feature/request_friend/presentation/screen/request_friend_screen.dart';

class FriendCardWidget extends StatelessWidget {
  const FriendCardWidget({super.key, required this.person});
  final FriendsModel person;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        context.push(RequestFriendScreen(user: person));
      },
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(5.0.r),
            child: NetWorkImageWidget(
              width: 60.0.w,
              height: 60.0.h,
              fit: BoxFit.cover,
              image: "${dotenv.env['SUPABASE_URL_IMAGE']}${person.image}",
            ),
          ),
          Gap(10.0.h),
          Expanded(
            child: Text(
              person.username.toString(),
              style: getBodyStyle(context: context),
            ),
          ),
        ],
      ),
    );
  }
}
