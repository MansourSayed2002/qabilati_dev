import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qabilati/core/shared/net_work_image_widget.dart';
import 'package:qabilati/core/theme/textstyle_app.dart';

class CardChatsWidget extends StatelessWidget {
  const CardChatsWidget({
    super.key,
    required this.title,
    required this.subtitle,
    required this.image,
    required this.onTap,
  });
  final String title;
  final String subtitle;
  final String image;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: ListTile(
        leading: ClipRRect(
          borderRadius: BorderRadius.circular(8.0.r),
          child: NetWorkImageWidget(
            width: 50.0.w,
            height: 50.0.h,
            fit: BoxFit.cover,
            image: "${dotenv.env['SUPABASE_URL_IMAGE']}$image",
          ),
        ),
        title: Text(
          title,
          style: getBodyStyle(fontSize: 17.0.sp, context: context),
        ),
        subtitle: Text(subtitle, style: getSmallStyle()),
      ),
    );
  }
}
