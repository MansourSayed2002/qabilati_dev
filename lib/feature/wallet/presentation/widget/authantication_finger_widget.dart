import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qabilati/core/class/local_authantication.dart';
import 'package:qabilati/core/extension/navigator_app.dart';
import 'package:qabilati/core/get_it/get_it.dart';
import 'package:qabilati/core/shared/elevated_button_widget.dart';
import 'package:qabilati/core/theme/color_app.dart';
import 'package:qabilati/feature/wallet/presentation/cubit/my_wallet_cubit.dart';
import 'package:qabilati/feature/wallet/presentation/screen/my_wallet_screen.dart';
import 'package:qabilati/generated/l10n.dart';

class AuthanticationFingerWidget extends StatefulWidget {
  const AuthanticationFingerWidget({super.key});

  @override
  State<AuthanticationFingerWidget> createState() =>
      _AuthanticationFingerWidgetState();
}

class _AuthanticationFingerWidgetState
    extends State<AuthanticationFingerWidget> {
  bool isActive = false;
  
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 17.0.w, vertical: 30.0.h),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SwitchListTile(
            title: Text(S.of(context).fingerprint),
            value: isActive,
            onChanged: (vlaue) async {
              bool isbiometric = await LocalAuthanticationApp.localauthfinger();
              if (isbiometric) {
                getIt<MyWalletCubit>().allowBiometric();
                setState(() {
                  isActive = !isActive;
                });
              }
            },
            activeColor: ColorApp.coral,
          ),
          Spacer(),
          ElevatedButtonWidget(
            title: S.of(context).finish,
            onTap: () {
              context.pushRepalceMent(MyWalletScreen());
            },
          ),
        ],
      ),
    );
  }
}
