import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:qabilati/core/theme/color_app.dart';
import 'package:qabilati/core/theme/textstyle_app.dart';
import 'package:qabilati/generated/l10n.dart';

class WalletOperationWidget extends StatelessWidget {
  const WalletOperationWidget({
    super.key,
    required this.onAddFundsPressed,
    required this.onWithdrawFundsPressed,
  });
  final VoidCallback onAddFundsPressed;
  final VoidCallback onWithdrawFundsPressed;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Expanded(
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: ColorApp.coral,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0.r),
              ),
            ),
            onPressed: onAddFundsPressed,
            child: Text(
              S.of(context).add_fund,
              style: getSmallStyle(color: ColorApp.white, fontSize: 15.0.sp),
            ),
          ),
        ),
        Gap(12.0.w),
        Expanded(
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: ColorApp.greyDa,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0.r),
              ),
            ),
            onPressed: onWithdrawFundsPressed,
            child: Text(
              S.of(context).withdraw_unds,
              style: getSmallStyle(fontSize: 15.0.sp, color: ColorApp.white),
            ),
          ),
        ),
      ],
    );
  }
}
