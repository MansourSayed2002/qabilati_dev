import 'dart:developer';

import 'package:qabilati/core/class/api_result.dart';
import 'package:qabilati/core/class/local_storage.dart';
import 'package:qabilati/core/enum/status_request.dart';
import 'package:qabilati/core/function/hashing_pin.dart';
import 'package:qabilati/feature/auth/data/model/user_model.dart';
import 'package:qabilati/feature/wallet/domain/repo_abs/wallet_repo_abs.dart';

class ActiveMywalletUsecase {
  ActiveMywalletUsecase({required this.walletRepoAbs});
  late WalletRepoAbs walletRepoAbs;
  Future<ApiResult> call(String pin) async {
    UserModel user = LocalStorageApp.getHiveData(LocalStorageApp.userData);
    try {
      await walletRepoAbs.activeMyWallet(pin: hashingPin(pin),userId: user.id??0);
      return ApiSuccess(StatusRequest.success);
    } catch (e) {
      log(e.toString());
      return ApiFailure(StatusRequest.failure);
    }
  }

  allowBiometric() async {
    try {
      await walletRepoAbs.authbiometric();
      return ApiSuccess(StatusRequest.success);
    } catch (e) {
      log(e.toString());
      return ApiFailure(StatusRequest.failure);
    }
  }
}
