import 'dart:developer';

import 'package:qabilati/core/class/api_result.dart';
import 'package:qabilati/core/enum/status_request.dart';
import 'package:qabilati/feature/wallet/data/model/transaction_model.dart';
import 'package:qabilati/feature/wallet/domain/repo_abs/wallet_repo_abs.dart';

class GetTransactionsUsecase {
  late WalletRepoAbs walletRepoAbs;
  GetTransactionsUsecase({required this.walletRepoAbs});

  Future<ApiResult> getTransactions() async {
    try {
      List response = await walletRepoAbs.getTransactions();
      if (response.isNotEmpty) {
        return ApiSuccess(
          response.map((e) => TransactionModel.fromJson(e)).toList(),
        );
      } else {
        return ApiFailure(StatusRequest.nodatafailure);
      }
    } catch (e) {
      log(e.toString());
      return ApiFailure(StatusRequest.failure);
    }
  }
}
