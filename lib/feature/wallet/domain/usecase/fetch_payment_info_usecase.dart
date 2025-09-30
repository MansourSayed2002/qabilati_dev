import 'dart:developer';
import 'package:qabilati/core/class/api_result.dart';
import 'package:qabilati/core/class/local_storage.dart';
import 'package:qabilati/core/enum/status_request.dart';
import 'package:qabilati/feature/auth/data/model/user_model.dart';
import 'package:qabilati/feature/wallet/domain/repo_abs/wallet_repo_abs.dart';
import 'package:qabilati/feature/wallet/domain/usecase/change_wallet_balance_uswecase.dart';
import 'package:qabilati/feature/wallet/domain/usecase/save_transactions_usecase.dart';

class FetchPaymentInfoUsecase {
  FetchPaymentInfoUsecase({
    required this.walletRepoAbs,
    required this.saveTransactionsUseCase,
    required this.changeWalletBalanceUswecase,
  });

  late WalletRepoAbs walletRepoAbs;
  late SaveTransactionsUseCase saveTransactionsUseCase;
  late ChangeWalletBalanceUswecase changeWalletBalanceUswecase;
  Future<ApiResult> fetchPaymentMethodInfo({
    required int orderId,
    required int currentBalance,
  }) async {
    try {
        UserModel user = LocalStorageApp.getHiveData(LocalStorageApp.userData);
      var result = await walletRepoAbs.fetchPaymentMethodInfo(orderId: orderId,userId: user.id??0);
      await saveTransactionsUseCase.saveTransactions(result: result);
      if (result['success'] == true) {
        await changeWalletBalanceUswecase.changeBalance(
          balance:
              (currentBalance + (result['order']['amount_cents'] / 100))
                  .toInt(),
        );
      }
      return ApiSuccess(result);
    } catch (e) {
      log(e.toString());
      return ApiFailure(StatusRequest.failure);
    }
  }
}
