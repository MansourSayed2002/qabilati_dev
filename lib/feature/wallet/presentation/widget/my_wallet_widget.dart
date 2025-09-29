import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:lottie/lottie.dart';
import 'package:qabilati/core/constants/image_app.dart';
import 'package:qabilati/core/enum/type_scan.dart';
import 'package:qabilati/core/extension/navigator_app.dart';
import 'package:qabilati/core/get_it/get_it.dart';
import 'package:qabilati/core/theme/textstyle_app.dart';
import 'package:qabilati/feature/scanner/scanner_screen.dart';
import 'package:qabilati/feature/wallet/presentation/cubit/my_wallet_cubit.dart';
import 'package:qabilati/feature/wallet/presentation/screen/add_fund_screen.dart';
import 'package:qabilati/feature/wallet/presentation/widget/balance_widget.dart';
import 'package:qabilati/feature/wallet/presentation/widget/recent_transaction_widegt.dart';
import 'package:qabilati/feature/wallet/presentation/widget/wallet_operation_widget.dart';
import 'package:qabilati/generated/l10n.dart';

class MyWalletWidget extends StatefulWidget {
  const MyWalletWidget({super.key});

  @override
  State<MyWalletWidget> createState() => _MyWalletWidgetState();
}

class _MyWalletWidgetState extends State<MyWalletWidget> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await getIt<MyWalletCubit>().getWallet();
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MyWalletCubit, MyWalletState>(
      buildWhen:
          (previous, current) =>
              current is MyWalletSuccess ||
              current is MyWalletError ||
              current is MyWalletLoading,
      builder: (context, state) {
        return state is MyWalletSuccess
            ? Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 20.0.w,
                vertical: 20.0.h,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Align(
                    alignment: Alignment.center,
                    child: Text(
                      S.of(context).wallet_des,
                      style: getSmallStyle(),
                    ),
                  ),
                  Gap(20.0.h),
                  BalanceWidget(
                    mywalletModel: state.wallet,
                    balance: "${state.wallet.currency} ${state.wallet.babance}",
                  ),
                  Gap(20.0.h),
                  WalletOperationWidget(
                    onAddFundsPressed: () {
                      context.push(
                        AddFundScreen(
                          balance: state.wallet.babance ?? 0,
                          walletId: state.wallet.walletId ?? 0,
                        ),
                      );
                    },
                    onWithdrawFundsPressed: () {
                      context.push(
                        ScannerScreen(
                          typeScannerWork: TypeScannerWork.withdrawfund,
                        ),
                      );
                    },
                  ),
                  Gap(20.0.h),
                  Text(
                    S.of(context).recent_transactions,
                    style: getBodyStyle(context: context, fontSize: 20.0.sp),
                  ),
                  RecentTransactionWidegt(),
                ],
              ),
            )
            : state is MyWalletLoading
            ? Center(
              child: Lottie.asset(
                LottieApp.loading,
                width: 200.0.w,
                height: 200.0.h,
              ),
            )
            : Center(child: Image.asset(ImageApp.error));
      },
    );
  }
}
