import 'package:qabilati/feature/wallet/data/model/transaction_model.dart';

abstract class WalletRepoAbs {
  Future<void> activeMyWallet({required String pin, required int userId});
  Future<void> authbiometric();
  getWallet(int userId);
  Future<String> getPaymentMethod({
    required String amount,
    required int userId,
  });
  Future<Map> fetchPaymentMethodInfo({
    required int orderId,
    required int userId,
  });
  Future<void> insertTransactions({required TransactionModel data});
  Future<void> changeBalance({required int balance, required int userId});
  Future<List> getTransactions(int userId);
}
