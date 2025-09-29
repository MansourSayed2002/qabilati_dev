import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:qabilati/core/class/local_storage.dart';
import 'package:qabilati/core/extension/message_bar.dart';
import 'package:qabilati/core/extension/navigator_app.dart';
import 'package:qabilati/core/get_it/get_it.dart';
import 'package:qabilati/core/shared/pin_keyboard_widget.dart';
import 'package:qabilati/core/theme/textstyle_app.dart';
import 'package:qabilati/feature/auth/presentation/widget/opt_widget.dart';
import 'package:qabilati/feature/wallet/presentation/cubit/my_wallet_cubit.dart';
import 'package:qabilati/generated/l10n.dart';

class PinWalletWidget extends StatefulWidget {
  const PinWalletWidget({super.key});

  @override
  State<PinWalletWidget> createState() => _PinWalletWidgetState();
}

class _PinWalletWidgetState extends State<PinWalletWidget> {
  TextEditingController optController = TextEditingController();

  @override
  void dispose() {
    optController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 13.0.w, vertical: 40.0.h),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            S.of(context).enter_pin,
            style: getSmallStyle(fontSize: 18.0.sp),
          ),
          Gap(20.0.h),
          OptWidget(
            controller: optController,
            length: 6,
            keyboardType: TextInputType.none,
            onTap: () {
              showModalBottomSheet(
                context: context,
                barrierColor: Colors.transparent,
                elevation: 0,
                builder: (_) {
                  return PinKeyboard(
                    onNumberTap: (value) {
                      onNumberTap(value);
                    },
                    onSubmit: () async {
                      context.pop();
                      bool result = await getIt<MyWalletCubit>().activeWallet(
                        optController.text,
                      );
                      if (result) {
                        getIt<MyWalletCubit>().pageController.jumpToPage(2);
                        var user = LocalStorageApp.getHiveData("user_data");
                        user['active_wallet'] = true;
                        await LocalStorageApp.setHiveData("user_data", user);
                      } else {
                        context.messageBar(S.of(context).message_error);
                      }
                    },
                    onBackspace: onBackspace,
                  );
                },
              );
            },
          ),
        ],
      ),
    );
  }

  void onBackspace() {
    if (optController.text.isNotEmpty) {
      setState(() {
        optController.text = optController.text.substring(
          0,
          optController.text.length - 1,
        );
      });
    }
  }

  void onNumberTap(String number) {
    if (optController.text.length < 4) {
      setState(() {
        optController.text += number;
      });
    }
  }
}
