import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:qabilati/core/theme/color_app.dart';
import 'package:qabilati/core/theme/textstyle_app.dart';

class RecentTransactionWidegt extends StatelessWidget {
  const RecentTransactionWidegt({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: 10,
        physics: BouncingScrollPhysics(),
        itemBuilder: (context, index) => TransactionCardWidget(),
      ),
    );
  }
}

class TransactionCardWidget extends StatelessWidget {
  const TransactionCardWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.0.w, vertical: 20.0.h),
      margin: EdgeInsets.symmetric(horizontal: 10.0.w, vertical: 10.0.h),
      decoration: BoxDecoration(
        color: ColorApp.greymiddle,
        borderRadius: BorderRadius.circular(10.0.r),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          CircleAvatar(
            backgroundColor: ColorApp.red.withAlpha(50),
            child: Icon(Icons.arrow_upward_rounded, color: ColorApp.red),
          ),
          Gap(10.0.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  " Deposit from Visa Card",
                  style: getSmallStyle(
                    fontSize: 16.0.sp,
                    color: ColorApp.black,
                  ),
                  textAlign: TextAlign.start,
                ),
                Text(
                  "11 Sep 2025",
                  style: getSmallStyle(color: ColorApp.greyDark),
                ),
              ],
            ),
          ),
          Gap(10.0.w),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "+EGP",
                style: getBodyStyle(
                  context: context,
                  fontSize: 18.0.sp,
                  color: ColorApp.red,
                ),
              ),
              Text(
                "500.00",
                style: getBodyStyle(
                  context: context,
                  fontSize: 18.0.sp,
                  color: ColorApp.red,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
