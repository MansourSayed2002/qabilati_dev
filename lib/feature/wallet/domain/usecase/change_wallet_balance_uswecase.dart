import 'dart:developer';

import 'package:qabilati/core/class/api_result.dart';
import 'package:qabilati/core/enum/status_request.dart';
import 'package:qabilati/feature/wallet/domain/repo_abs/wallet_repo_abs.dart';

class ChangeWalletBalanceUswecase {
  late WalletRepoAbs walletRepoAbs;
  ChangeWalletBalanceUswecase({required this.walletRepoAbs});

  Future<ApiResult> changeBalance({
    required int balance,
  }) async {
    try {
      await walletRepoAbs.changeBalance(balance:balance);
      return ApiSuccess(StatusRequest.success);
    } catch (e) {
      log(e.toString());
      return ApiFailure(StatusRequest.failure);
    }
  }
}
