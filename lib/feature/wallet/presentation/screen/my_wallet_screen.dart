import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qabilati/core/class/local_storage.dart';
import 'package:qabilati/core/get_it/get_it.dart';
import 'package:qabilati/core/shared/arrow_back_widget.dart';
import 'package:qabilati/feature/auth/data/model/user_model.dart';
import 'package:qabilati/feature/wallet/presentation/cubit/my_wallet_cubit.dart';
import 'package:qabilati/feature/wallet/presentation/widget/my_wallet_widget.dart';
import 'package:qabilati/feature/wallet/presentation/widget/active_wallet_widget.dart';
import 'package:qabilati/feature/wallet/presentation/widget/authantication_finger_widget.dart';
import 'package:qabilati/feature/wallet/presentation/widget/pin_wallet_widget.dart';
import 'package:qabilati/generated/l10n.dart';

class MyWalletScreen extends StatelessWidget {
  const MyWalletScreen({super.key});

  @override
  Widget build(BuildContext context) {
    UserModel user = LocalStorageApp.getHiveData(LocalStorageApp.userData);
    return BlocProvider.value(
      value: getIt<MyWalletCubit>(),
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(S.of(context).wallet),
          leading: ArrowBackWidget(),
        ),
        body:
            user.isActiveWallet == false
                ? PageView.builder(
                  itemCount: 3,
                  controller: getIt<MyWalletCubit>().pageController,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    if (index == 0) {
                      return ActiveWalletWidget();
                    } else if (index == 1) {
                      return PinWalletWidget();
                    } else {
                      return AuthanticationFingerWidget();
                    }
                  },
                )
                : MyWalletWidget(),
      ),
    );
  }
}
