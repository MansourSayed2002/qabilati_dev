import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:lottie/lottie.dart';
import 'package:qabilati/core/constants/image_app.dart';
import 'package:qabilati/core/get_it/get_it.dart';
import 'package:qabilati/core/shared/elevated_button_widget.dart';
import 'package:qabilati/feature/wallet/presentation/cubit/my_wallet_cubit.dart';
import 'package:qabilati/generated/l10n.dart';

class ActiveWalletWidget extends StatelessWidget {
  const ActiveWalletWidget({super.key});
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Lottie.asset(LottieApp.loading, width: 200.0.w, height: 200.0.h),
        Gap(20.0.h),
        SizedBox(
          width: 200.0.w,
          child: ElevatedButtonWidget(
            title: S.of(context).active_mywallet,
            onTap: () {
              getIt<MyWalletCubit>().pageController.jumpToPage(1);
            },
          ),
        ),
      ],
    );
  }
}
