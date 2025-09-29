import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:qabilati/core/get_it/get_it.dart';
import 'package:qabilati/core/shared/skeletonizer_loading_widget.dart';
import 'package:qabilati/core/theme/color_app.dart';
import 'package:qabilati/core/theme/textstyle_app.dart';
import 'package:qabilati/feature/wallet/data/model/transaction_model.dart';

import 'package:qabilati/feature/wallet/presentation/cubit/my_wallet_cubit.dart';
import 'package:skeletonizer/skeletonizer.dart';

class RecentTransactionWidegt extends StatefulWidget {
  const RecentTransactionWidegt({super.key});

  @override
  State<RecentTransactionWidegt> createState() =>
      _RecentTransactionWidegtState();
}

class _RecentTransactionWidegtState extends State<RecentTransactionWidegt> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await getIt<MyWalletCubit>().getTransactions();
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MyWalletCubit, MyWalletState>(
      buildWhen:
          (previous, current) =>
              current is TransactionsLoading ||
              current is TransactionsSuccess ||
              current is TransactionsError,
      builder: (context, state) {
        return Expanded(
          child: Skeletonizer(
            enabled: state is TransactionsLoading,
            child:
                state is TransactionsSuccess
                    ? ListView.builder(
                      itemCount: state.transactions.length,
                      physics: BouncingScrollPhysics(),
                      itemBuilder: (context, index) {
                        List<TransactionModel> transaction = state.transactions;
                        return TransactionCardWidget(
                          date: transaction[index].createdAt.toString(),
                          paymentBy: transaction[index].paymentBy.toString(),
                          amount: transaction[index].amount.toString(),
                        );
                      },
                    )
                    : SkeletonizerLoadingWidget(),
          ),
        );
      },
    );
  }
}

class TransactionCardWidget extends StatelessWidget {
  const TransactionCardWidget({
    super.key,
    required this.date,

    required this.paymentBy,
    this.amount,
    this.currency,
  });
  final String date;
  final String paymentBy;
  final dynamic amount;
  final String? currency;
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
                  paymentBy,
                  style: getSmallStyle(
                    fontSize: 16.0.sp,
                    color: ColorApp.black,
                  ),
                  textAlign: TextAlign.start,
                ),
                Text(date, style: getSmallStyle(color: ColorApp.greyDark)),
              ],
            ),
          ),
          Gap(10.0.w),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                currency ?? "+EGP",
                style: getBodyStyle(
                  context: context,
                  fontSize: 18.0.sp,
                  color: ColorApp.red,
                ),
              ),
              Text(
                "$amount",
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
