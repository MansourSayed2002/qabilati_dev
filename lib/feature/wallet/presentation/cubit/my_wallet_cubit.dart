import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:qabilati/core/class/api_result.dart';
import 'package:qabilati/feature/wallet/data/model/mywallet_model.dart';
import 'package:qabilati/feature/wallet/data/model/transaction_model.dart';
import 'package:qabilati/feature/wallet/domain/usecase/active_mywallet_usecase.dart';
import 'package:qabilati/feature/wallet/domain/usecase/fetch_payment_info_usecase.dart';
import 'package:qabilati/feature/wallet/domain/usecase/get_transactions_usecase.dart';
import 'package:qabilati/feature/wallet/domain/usecase/get_url_payment_method_usecase.dart';
import 'package:qabilati/feature/wallet/domain/usecase/get_wallet_usercase.dart';

part 'my_wallet_state.dart';

class MyWalletCubit extends Cubit<MyWalletState> {
  MyWalletCubit({
    required this.activeMywalletUsecase,
    required this.getWalletUsercase,
    required this.getPaymentMethodUsecase,
    required this.fetchPaymentInfoUsecase,
    required this.getTransactionsUsecase,
  }) : super(MyWalletInitial());

  late ActiveMywalletUsecase activeMywalletUsecase;

  late GetWalletUsercase getWalletUsercase;

  late GetUrlPaymentMethodUsecase getPaymentMethodUsecase;

  late FetchPaymentInfoUsecase fetchPaymentInfoUsecase;

  late GetTransactionsUsecase getTransactionsUsecase;

  PageController pageController = PageController();

  MywalletModel? walletData;

  Future<bool> activeWallet(String pin) async {
    var result = await activeMywalletUsecase.call(pin);
    if (result is ApiSuccess) {
      return true;
    } else {
      return false;
    }
  }

  Future<void> allowBiometric() async {
    await activeMywalletUsecase.allowBiometric();
  }

  Future<void> getWallet() async {
    emit(MyWalletLoading());
    var response = await getWalletUsercase.getWallet();

    if (response is ApiSuccess) {
      walletData = response.data;
      emit(MyWalletSuccess(wallet: response.data));
    } else {
      emit(MyWalletError());
    }
  }

  Future<void> getPaymentMethod({required String amount}) async {
    emit(GetUrlLoading());
    var result = await getPaymentMethodUsecase.getUrlPaymentMethod(
      amount: amount,
    );
    if (result is ApiSuccess) {
      emit(GetUrlSuccess(url: result.data));
    } else {
      emit(GetUrlError());
    }
  }

  Future<void> fetchPaymentMethodInfo({
    required int orderId,
    required int currentBalance,
  }) async {
    emit(PaymentLoading());
    var result = await fetchPaymentInfoUsecase.fetchPaymentMethodInfo(
      orderId: orderId,
      currentBalance: currentBalance,
    );
    if (result is ApiSuccess) {
      emit(PaymentSuccess());
    } else {
      emit(PaymentError());
    }
  }

  getTransactions() async {
    emit(TransactionsLoading());
    var response = await getTransactionsUsecase.getTransactions();
    if (response is ApiSuccess) {
      emit(TransactionsSuccess(transactions: response.data));
    } else {
      emit(TransactionsError());
    }
  }
}
