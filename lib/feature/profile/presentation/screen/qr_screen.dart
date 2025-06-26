import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:pretty_qr_code/pretty_qr_code.dart';
import 'package:qabilati/core/shared/arrow_back_widget.dart';
import 'package:qabilati/core/theme/color_app.dart';
import 'package:qabilati/core/theme/textstyle_app.dart';
import 'package:qabilati/generated/l10n.dart';

class QrScreen extends StatelessWidget {
  const QrScreen({super.key, required this.uuid});
  final String uuid;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(leading: ArrowBackWidget()),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 7.0.h, vertical: 7.0.h),
              margin: EdgeInsets.symmetric(
                horizontal: 10.0.w,
                vertical: 10.0.h,
              ),
              decoration: BoxDecoration(
                color: ColorApp.greymiddle,
                border: Border.all(color: ColorApp.coral),
                borderRadius: BorderRadius.circular(10.0.r),
              ),
              child: Icon(Icons.qr_code_scanner_rounded, color: ColorApp.coral),
            ),
            Text(S.of(context).scan_qr, style: getBodyStyle(context: context)),
            Gap(6.0.h),
            Text(S.of(context).scan_qr_body, style: getSmallStyle()),
            Container(
              margin: EdgeInsets.symmetric(
                horizontal: 30.0.h,
                vertical: 30.0.h,
              ),
              decoration: BoxDecoration(
                color: ColorApp.greymiddle,
                border: Border.all(color: ColorApp.grey),
                borderRadius: BorderRadius.circular(10.0.r),
              ),
              child: PrettyQrView.data(
                data: uuid,
                decoration: const PrettyQrDecoration(
                  quietZone: PrettyQrQuietZone.modules(3),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
