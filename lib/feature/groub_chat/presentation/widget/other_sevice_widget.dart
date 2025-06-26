import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qabilati/core/theme/color_app.dart';
import 'package:qabilati/core/theme/textstyle_app.dart';
import 'package:qabilati/generated/l10n.dart';

class OtherSeviceWidget extends StatelessWidget {
  const OtherSeviceWidget({
    super.key,
    required this.onTapQrCode,
    required this.onTapScannerQrCode,
    required this.onTapAudioBroadcast,
  });
  final VoidCallback onTapQrCode;
  final VoidCallback onTapScannerQrCode;
  final VoidCallback onTapAudioBroadcast;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CardOtherServiceWidget(
          iconData: Icons.qr_code,
          title: S.of(context).qr_Groub,
          onTap: onTapQrCode,
        ),
        CardOtherServiceWidget(
          iconData: Icons.qr_code_scanner_outlined,
          title: S.of(context).scan_qr,
          onTap: onTapScannerQrCode,
        ),
        CardOtherServiceWidget(
          iconData: Icons.voice_chat,
          title: S.of(context).audio_broadcast,
          onTap: onTapAudioBroadcast,
        ),
      ],
    );
  }
}

class CardOtherServiceWidget extends StatelessWidget {
  const CardOtherServiceWidget({
    super.key,
    required this.title,
    required this.iconData,
    required this.onTap,
  });
  final String title;
  final IconData iconData;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: 90.0.w,
        height: 83.0.h,
        padding: EdgeInsets.symmetric(horizontal: 15.0.w, vertical: 15.0.h),
        margin: EdgeInsets.symmetric(horizontal: 10.0.w, vertical: 10.0.h),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0.r),
          border: Border.all(color: ColorApp.coral),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(iconData, color: ColorApp.coral),
            Text(
              title,
              style: getSmallStyle(),
              maxLines: 2,
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
