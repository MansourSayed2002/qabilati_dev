import 'dart:convert';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:qabilati/core/class/local_storage.dart';
import 'package:qabilati/core/constants/link_app.dart';
import 'package:qabilati/feature/wallet/data/api/wallet_api.dart';
import 'package:qabilati/feature/wallet/data/model/transaction_model.dart';
import 'package:qabilati/feature/wallet/domain/repo_abs/wallet_repo_abs.dart';

class WalletRepoImp extends WalletRepoAbs {
  @override
  Future<void> activeMyWallet({required String pin}) async {
    final userId = LocalStorageApp.getHiveData("user_data")["user_id"];
    List response = await WalletApi.insert(
      table: TablesApp.wallets,
      values: {ColumsApp.userId: userId},
    );
    LocalStorageApp.setHiveData('wallet_id', response.first['wallet_id']);
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
    await WalletApi.update(
      table: TablesApp.walletSecurity,
      values: {ColumsApp.biometricEnabled: true},
      column: ColumsApp.walletId,
      value: LocalStorageApp.getHiveData("wallet_id"),
    );
  }

  @override
  getWallet() async {
    return await WalletApi.rpc(
      nameFun: "get_mywallet",
      params: {
        "target_user": LocalStorageApp.getHiveData("user_data")["user_id"],
      },
    );
  }

  @override
  Future<String> getPaymentMethod({required String amount}) async {
    final userId = LocalStorageApp.getHiveData("user_data")["user_id"];
    var result = await WalletApi.invoke(
      baseUrl: dotenv.env['URL_PAYMOB_OPERATION'].toString(),

      body: jsonEncode({"user_id": userId, "amount": amount}),
    );
    return result['client_url'];
  }

  @override
  Future<Map> fetchPaymentMethodInfo({required int orderId}) async {
    final userId = LocalStorageApp.getHiveData("user_data")["user_id"];
    return await WalletApi.invoke(
      baseUrl: dotenv.env['URL_FETCH_PAYMENT_INFO'].toString(),

      body: jsonEncode({"user_id": userId, "order_id": orderId}),
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
  Future<void> changeBalance({required int balance}) async {
    final user = LocalStorageApp.getHiveData("user_data")["user_id"];
    await WalletApi.update(
      table: TablesApp.wallets,
      values: {ColumsApp.balance: balance},
      column: ColumsApp.userId,
      value: user,
    );
  }

  @override
  Future<List> getTransactions() async {
    final userId = LocalStorageApp.getHiveData("user_data")["user_id"];
    return await WalletApi.select(
      table: TablesApp.transactions,
      column: ColumsApp.userId,
      value: userId,
    );
  }
}
