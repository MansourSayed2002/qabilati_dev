import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:qabilati/core/function/is_arabic.dart';
import 'package:qabilati/core/shared/action_button_widget.dart';
import 'package:qabilati/core/shared/net_work_image_widget.dart';
import 'package:qabilati/core/theme/textstyle_app.dart';

class CardPosts extends StatelessWidget {
  const CardPosts({
    super.key,
    required this.username,
    required this.post,
    required this.image,
    required this.onTap,
  });
  final String username;
  final String post;
  final String image;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 13.0.w, vertical: 13.0.h),
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(15.0.r),
                  child: NetWorkImageWidget(
                    image: "${dotenv.env['SUPABASE_URL_IMAGE']}$image",
                    width: 56.0.w,
                    height: 56.0.h,
                  ),
                ),
                Gap(15.0.w),
                Text(
                  username,
                  style: getBodyStyle(context: context, fontSize: 16.0.sp),
                ),
              ],
            ),
            Gap(15.0.h),
            Text(
              post,
              style: getBodyStyle(
                context: context,
                fontSize: 16.0.sp,
                fontWeight: FontWeight.w400,
              ),
              textAlign:
                  isArabic(post.toString()) ? TextAlign.right : TextAlign.left,
            ),
            Gap(10.0.w),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Expanded(
                  child: ActionButtonWidget(
                    iconData: Icons.favorite,
                    color: Colors.red,
                  ),
                ),
                Expanded(
                  child: ActionButtonWidget(iconData: Icons.comment_outlined),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
