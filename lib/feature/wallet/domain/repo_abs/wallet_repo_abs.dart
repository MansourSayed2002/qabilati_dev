import 'package:qabilati/feature/wallet/data/model/transaction_model.dart';

abstract class WalletRepoAbs {
  Future<void> activeMyWallet({required String pin});
  Future<void> authbiometric();
  getWallet();
  Future<String> getPaymentMethod({required String amount});
  Future<Map> fetchPaymentMethodInfo({required int orderId});
  Future<void> insertTransactions({required TransactionModel data});
  Future<void> changeBalance({required int balance});
  Future<List> getTransactions();
}
