import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:qabilati/core/extension/message_bar.dart';
import 'package:qabilati/core/extension/navigator_app.dart';
import 'package:qabilati/core/function/loading_widget.dart';
import 'package:qabilati/core/function/validation.dart';
import 'package:qabilati/core/get_it/get_it.dart';
import 'package:qabilati/core/shared/arrow_back_widget.dart';
import 'package:qabilati/core/shared/custom_text_from_global.dart';
import 'package:qabilati/core/theme/textstyle_app.dart';
import 'package:qabilati/feature/wallet/presentation/cubit/my_wallet_cubit.dart';
import 'package:qabilati/feature/wallet/presentation/screen/payment_screen.dart';
import 'package:qabilati/feature/wallet/presentation/widget/card_payment_widget.dart';
import 'package:qabilati/generated/l10n.dart';

class AddFundScreen extends StatefulWidget {
  const AddFundScreen({super.key, required this.balance});
  final int balance;
  @override
  State<AddFundScreen> createState() => _AddFundScreenState();
}

class _AddFundScreenState extends State<AddFundScreen> {
  TextEditingController amountController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  @override
  void dispose() {
    amountController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: getIt<MyWalletCubit>(),
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(S.of(context).add_fund),
          leading: ArrowBackWidget(),
        ),
        body: BlocConsumer<MyWalletCubit, MyWalletState>(
          buildWhen:
              (previous, current) =>
                  current is GetUrlSuccess ||
                  current is GetUrlLoading ||
                  current is GetUrlError,
          listener: (context, state) {
            if (state is GetUrlSuccess) {
              context.pop();
              context.push(
                PaymentScreen(url: state.url, balance: widget.balance),
              );
            } else if (state is GetUrlLoading) {
              loadingWidget(context);
            } else if (state is GetUrlError) {
              context.messageBar(S.of(context).message_error);
            }
          },
          builder: (context, state) {
            final cubit = getIt<MyWalletCubit>();
            return Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 20.0.w,
                vertical: 20.0.h,
              ),
              child: Form(
                key: formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomTextFormGlobal(
                      hinttext: S.of(context).amount_add,
                      controller: amountController,
                      validator: (value) {
                        return validationField(context, "number", 2, 20, value);
                      },
                    ),
                    Gap(20.0.h),
                    Text(
                      S.of(context).choose_payment,
                      style: getBodyStyle(context: context, fontSize: 18.0.sp),
                    ),
                    Gap(20.0.h),
                    CardPaymentWidget(
                      title: S.of(context).credit_card,
                      subTitle: "Visa, Mastercard",
                      iconData: Icons.credit_card,
                      onTap: () async {
                        if (formKey.currentState!.validate()) {
                          cubit.getPaymentMethod(amount: amountController.text);
                          amountController.clear();
                        }
                      },
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
