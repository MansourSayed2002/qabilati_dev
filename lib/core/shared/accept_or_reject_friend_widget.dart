import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:qabilati/core/theme/color_app.dart';
import 'package:qabilati/feature/notification/presentation/widget/custom_bottom_widget.dart';
import 'package:qabilati/generated/l10n.dart';

class AcceptOrRejectFriendWidget extends StatelessWidget {
  const AcceptOrRejectFriendWidget({
    super.key,
    required this.rejectFriendOnTap,
    required this.acceptFriendOnTap,
  });
  final VoidCallback rejectFriendOnTap;
  final VoidCallback acceptFriendOnTap;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CustomBottomWidget(
          onTap: rejectFriendOnTap,
          title: S.of(context).reject,
          colorbutton: ColorApp.red,
        ),
        Gap(10.0.w),
        CustomBottomWidget(
          onTap: acceptFriendOnTap,
          title: S.of(context).accept,
        ),
      ],
    );
  }
}
