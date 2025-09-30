import 'dart:developer';

import 'package:qabilati/core/class/api_result.dart';
import 'package:qabilati/core/class/local_storage.dart';
import 'package:qabilati/core/enum/status_request.dart';
import 'package:qabilati/feature/auth/data/model/user_model.dart';
import 'package:qabilati/feature/wallet/domain/repo_abs/wallet_repo_abs.dart';

class GetUrlPaymentMethodUsecase {
  GetUrlPaymentMethodUsecase({required this.walletRepoAbs});

  late WalletRepoAbs walletRepoAbs;

  Future<ApiResult> getUrlPaymentMethod({required String? amount}) async {
    try {
        UserModel user = LocalStorageApp.getHiveData(LocalStorageApp.userData);
      String result = await walletRepoAbs.getPaymentMethod(
        amount: (((int.tryParse(amount ?? '0')) ?? 0) * 100).toString(),
        userId: user.id ?? 0,
      );
      return ApiSuccess(result);
    } catch (e) {
      log(e.toString());
      return ApiFailure(StatusRequest.failure);
    }
  }
}
