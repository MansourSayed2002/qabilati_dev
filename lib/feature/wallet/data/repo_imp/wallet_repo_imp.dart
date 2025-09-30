import 'dart:convert';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:qabilati/core/class/local_storage.dart';
import 'package:qabilati/core/constants/link_app.dart';
import 'package:qabilati/feature/wallet/data/api/wallet_api.dart';
import 'package:qabilati/feature/wallet/data/model/transaction_model.dart';
import 'package:qabilati/feature/wallet/domain/repo_abs/wallet_repo_abs.dart';

class WalletRepoImp extends WalletRepoAbs {
  @override
  Future<void> activeMyWallet({
    required String pin,
    required int userId,
  }) async {
    List response = await WalletApi.insert(
      table: TablesApp.wallets,
      values: {ColumsApp.userId: userId},
    );
    LocalStorageApp.setSecureStorage(
      ColumsApp.walletId,
      response.first['wallet_id'].toString(),
    );
    await WalletApi.update(
      table: TablesApp.user,
      values: {ColumsApp.activeWallet: true},
      column: ColumsApp.userId,
      value: userId,
    );
    await WalletApi.insert(
      table: TablesApp.walletSecurity,
      values: {
        ColumsApp.walletId: response.first['wallet_id'],
        ColumsApp.pinHash: pin,
      },
    );
  }

  @override
  Future<void> authbiometric() async {
    final walletId = await LocalStorageApp.getSecureStorage(ColumsApp.walletId);
    await WalletApi.update(
      table: TablesApp.walletSecurity,
      values: {ColumsApp.biometricEnabled: true},
      column: ColumsApp.walletId,
      value: int.tryParse(walletId) ?? 0,
    );
  }

  @override
  getWallet(userId) async {
    return await WalletApi.rpc(
      nameFun: "get_mywallet",
      params: {"target_user": userId},
    );
  }

  @override
  Future<String> getPaymentMethod({
    required String amount,
    required int userId,
  }) async {
    var result = await WalletApi.invoke(
      baseUrl: dotenv.env['URL_PAYMOB_OPERATION'].toString(),

      body: jsonEncode({"user_id": userId, "amount": amount}),
    );
    return result['client_url'];
  }

  @override
  Future<Map> fetchPaymentMethodInfo({
    required int orderId,
    required int userId,
  }) async {
    return await WalletApi.invoke(
      baseUrl: dotenv.env['URL_FETCH_PAYMENT_INFO'].toString(),

      body: jsonEncode({ColumsApp.userId: userId, "order_id": orderId}),
    );
  }

  @override
  Future<void> insertTransactions({required TransactionModel data}) async {
    await WalletApi.insert(
      table: TablesApp.transactions,
      values: data.toJson(),
    );
  }

  @override
  Future<void> changeBalance({
    required int balance,
    required int userId,
  }) async {
    await WalletApi.update(
      table: TablesApp.wallets,
      values: {ColumsApp.balance: balance},
      column: ColumsApp.userId,
      value: userId,
    );
  }

  @override
  Future<List> getTransactions(userId) async {
    return await WalletApi.select(
      table: TablesApp.transactions,
      column: ColumsApp.userId,
      value: userId,
    );
  }
}
