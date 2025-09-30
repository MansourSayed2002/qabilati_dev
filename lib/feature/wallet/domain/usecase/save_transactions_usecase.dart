import 'dart:developer';

import 'package:qabilati/core/class/local_storage.dart';
import 'package:qabilati/feature/auth/data/model/user_model.dart';
import 'package:qabilati/feature/wallet/data/model/transaction_model.dart';
import 'package:qabilati/feature/wallet/domain/repo_abs/wallet_repo_abs.dart';

class SaveTransactionsUseCase {
  SaveTransactionsUseCase({required this.walletRepoAbs});

  late WalletRepoAbs walletRepoAbs;

  Future saveTransactions({required Map result}) async {
    try {
      UserModel user = LocalStorageApp.getHiveData(LocalStorageApp.userData);
      await walletRepoAbs.insertTransactions(
        data: TransactionModel(
          userId: user.id ?? 0,
          orderId: result['order']['id'],
          amount: result['order']['amount_cents'] / 100,
          status: result['success'],
          paymentBy: "Visa Card",
          createdAt: result['order']['created_at'],
        ),
      );
    } catch (e) {
      log(e.toString());
    }
  }
}
