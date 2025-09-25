import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:qabilati/core/theme/color_app.dart';
import 'package:qabilati/core/theme/textstyle_app.dart';
import 'package:qabilati/generated/l10n.dart';

class BalanceWidget extends StatefulWidget {
  const BalanceWidget({super.key, required this.balance});
  final String balance;

  @override
  State<BalanceWidget> createState() => _BalanceWidgetState();
}

class _BalanceWidgetState extends State<BalanceWidget> {
  bool isShow = false;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        //  context.push()
      },
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(horizontal: 10.0.w, vertical: 20.0.h),
        decoration: BoxDecoration(
          color: ColorApp.peach,
          borderRadius: BorderRadius.circular(10.0.r),
        ),
        child: Column(
          children: [
            Text(
              S.of(context).current_balance,
              style: getSmallStyle(fontSize: 15.0.sp),
            ),
            Gap(10.0.h),
            Text(
              isShow ? widget.balance : "*********",
              style: getBodyStyle(context: context),
            ),
          ],
        ),
      ),
    );
  }
}
