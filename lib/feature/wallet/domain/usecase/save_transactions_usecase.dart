import 'dart:developer';

import 'package:qabilati/core/class/local_storage.dart';
import 'package:qabilati/feature/wallet/data/model/transaction_model.dart';
import 'package:qabilati/feature/wallet/domain/repo_abs/wallet_repo_abs.dart';

class SaveTransactionsUseCase {
  SaveTransactionsUseCase({required this.walletRepoAbs});

  late WalletRepoAbs walletRepoAbs;

  Future saveTransactions({required Map result}) async {
    try {
      final userId = LocalStorageApp.getHiveData("user_data")["user_id"];
      await walletRepoAbs.insertTransactions(
        data: TransactionModel(
          userId: userId,
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
