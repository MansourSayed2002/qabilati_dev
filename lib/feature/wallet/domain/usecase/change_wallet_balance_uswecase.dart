import 'dart:developer';

import 'package:qabilati/core/class/api_result.dart';
import 'package:qabilati/core/class/local_storage.dart';
import 'package:qabilati/core/enum/status_request.dart';
import 'package:qabilati/feature/auth/data/model/user_model.dart';
import 'package:qabilati/feature/wallet/domain/repo_abs/wallet_repo_abs.dart';

class ChangeWalletBalanceUswecase {
  late WalletRepoAbs walletRepoAbs;
  ChangeWalletBalanceUswecase({required this.walletRepoAbs});

  Future<ApiResult> changeBalance({required int balance}) async {
    try {
      UserModel user = LocalStorageApp.getHiveData(LocalStorageApp.userData);
      await walletRepoAbs.changeBalance(balance: balance, userId: user.id ?? 0);
      return ApiSuccess(StatusRequest.success);
    } catch (e) {
      log(e.toString());
      return ApiFailure(StatusRequest.failure);
    }
  }
}
