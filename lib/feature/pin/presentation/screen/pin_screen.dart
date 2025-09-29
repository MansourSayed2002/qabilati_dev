import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:qabilati/core/extension/message_bar.dart';
import 'package:qabilati/core/extension/navigator_app.dart';
import 'package:qabilati/core/function/loading_widget.dart';
import 'package:qabilati/core/get_it/get_it.dart' show getIt;
import 'package:qabilati/core/shared/arrow_back_widget.dart';
import 'package:qabilati/core/shared/pin_keyboard_widget.dart';
import 'package:qabilati/core/theme/textstyle_app.dart';
import 'package:qabilati/feature/auth/presentation/widget/opt_widget.dart';
import 'package:qabilati/feature/pin/presentation/cubit/pin_cubit.dart';
import 'package:qabilati/generated/l10n.dart';

class PinScreen extends StatefulWidget {
  const PinScreen({super.key, required this.walletId, required this.onPressed});
  final int walletId;
  final VoidCallback onPressed;
  @override
  State<PinScreen> createState() => _PinScreenState();
}

class _PinScreenState extends State<PinScreen> {
  TextEditingController optController = TextEditingController();

  @override
  void dispose() {
    optController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: getIt<PinCubit>(),
      child: Scaffold(
        appBar: AppBar(leading: ArrowBackWidget()),
        body: BlocListener<PinCubit, PinState>(
          listener: (context, state) {
            if (state is PinSuccess) {
              if (Navigator.canPop(context)) {
                context.pop();
              }
              widget.onPressed();
              context.pop();
            } else if (state is PinLoading) {
              loadingWidget(context);
            } else {
              context.pop();
              context.messageBar(S.of(context).message_error);
            }
          },
          child: Padding(
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
                            await getIt<PinCubit>().checkPin(
                              pin: optController.text,
                              walletId: widget.walletId,
                            );
                          },
                          onBackspace: onBackspace,
                        );
                      },
                    );
                  },
                ),
              ],
            ),
          ),
        ),
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
    if (optController.text.length < 6) {
      setState(() {
        optController.text += number;
      });
    }
  }
}
