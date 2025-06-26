import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qabilati/core/theme/color_app.dart';
import 'package:qabilati/core/theme/textstyle_app.dart';
import 'package:qabilati/feature/friends/presentation/widget/cards_ships.dart';
import 'package:qabilati/generated/l10n.dart';

class ContactsWithQabilati extends StatelessWidget {
  const ContactsWithQabilati({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: 8.0.w, vertical: 8.0.h),
          width: double.infinity,
          color: ColorApp.grey,
          child: Text(S.of(context).my_work, style: getSmallStyle()),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 17.0.w),
          child: Cardships(
            title: S.of(context).qabilati_contacts,
            onTap: () {},
            iconData: CupertinoIcons.chat_bubble_text_fill,
            cardColor: Colors.blueAccent,
          ),
        ),
      ],
    );
  }
}
