import 'dart:developer';

import 'package:qabilati/core/class/api_result.dart';
import 'package:qabilati/core/enum/status_request.dart';
import 'package:qabilati/feature/wallet/domain/repo_abs/wallet_repo_abs.dart';

class GetUrlPaymentMethodUsecase {
  GetUrlPaymentMethodUsecase({required this.walletRepoAbs});

  late WalletRepoAbs walletRepoAbs;

  Future<ApiResult> getUrlPaymentMethod({required String? amount}) async {
    try {
      String result = await walletRepoAbs.getPaymentMethod(
        amount: (((int.tryParse(amount ?? '0')) ?? 0) * 100).toString(),
      );
      return ApiSuccess(result);
    } catch (e) {
      log(e.toString());
      return ApiFailure(StatusRequest.failure);
    }
  }
}
