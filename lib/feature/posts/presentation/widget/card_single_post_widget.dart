import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:qabilati/core/function/is_arabic.dart';
import 'package:qabilati/core/shared/action_button_widget.dart';
import 'package:qabilati/core/shared/net_work_image_widget.dart';
import 'package:qabilati/core/theme/color_app.dart';
import 'package:qabilati/core/theme/textstyle_app.dart';
import 'package:qabilati/feature/posts/data/model/posts_model.dart';

class CardSinglePostWidget extends StatelessWidget {
  const CardSinglePostWidget({super.key, required this.post});
  final PostModel post;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(15.0.r),
              child: NetWorkImageWidget(
                image: "${dotenv.env['SUPABASE_URL_IMAGE']}${post.userImage}",
                width: 56.0.w,
                height: 56.0.h,
              ),
            ),
            Gap(15.0.w),
            Column(
              children: [
                Text(
                  post.userName.toString(),
                  style: getBodyStyle(context: context, fontSize: 16.0.sp),
                ),
                Text(
                  "@${post.userName!.replaceAll(" ", "_").toString()}",
                  style: getSmallStyle(),
                ),
              ],
            ),
          ],
        ),
        Gap(15.0.h),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 17.0.w, vertical: 17.0.h),
          width: double.infinity,
          decoration: BoxDecoration(
            color: ColorApp.peach.withAlpha(70),
            borderRadius: BorderRadius.circular(10.0.r),
          ),
          child: Text(
            post.postContent.toString(),
            textAlign:
                isArabic(post.postContent.toString())
                    ? TextAlign.right
                    : TextAlign.left,
            style: getBodyStyle(context: context, fontSize: 18.0.sp),
          ),
        ),
        Gap(10.0.h),
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
            Expanded(child: ActionButtonWidget(iconData: Icons.share)),
          ],
        ),
      ],
    );
  }
}
