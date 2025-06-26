import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qabilati/core/shared/accept_or_reject_friend_widget.dart';
import 'package:qabilati/core/shared/net_work_image_widget.dart';
import 'package:qabilati/core/theme/textstyle_app.dart';

class CardNotifiWidget extends StatelessWidget {
  const CardNotifiWidget({
    super.key,
    required this.title,
    required this.subtitle,
    required this.image,
  });
  final String title;
  final String subtitle;
  final String image;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: ClipRRect(
        borderRadius: BorderRadius.circular(5.0.r),
        child: NetWorkImageWidget(
          image: "${dotenv.env['SUPABASE_URL_IMAGE']}$image",
          width: 100.0.w,
          height: 100.0.h,
        ),
      ),
      title: Text(title, style: getBodyStyle(context: context)),
      subtitle: Text(subtitle, style: getSmallStyle()),
    );
  }
}

class CardNotifiRequestWidget extends StatelessWidget {
  const CardNotifiRequestWidget({
    super.key,
    required this.title,
    required this.image,
    required this.rejectFriendOnTap,
    required this.acceptFriendOnTap,
  });
  final String title;
  final String image;
  final VoidCallback rejectFriendOnTap;
  final VoidCallback acceptFriendOnTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: ClipRRect(
        borderRadius: BorderRadius.circular(5.0.r),
        child: NetWorkImageWidget(
          image: "${dotenv.env['SUPABASE_URL_IMAGE']}$image",
          width: 100.0.w,
          height: 100.0.h,
        ),
      ),
      title: Text(
        title,
        style: getBodyStyle(context: context, fontSize: 18.0.sp),
      ),
      subtitle: AcceptOrRejectFriendWidget(
        rejectFriendOnTap: rejectFriendOnTap,
        acceptFriendOnTap: acceptFriendOnTap,
      ),
    );
  }
}
