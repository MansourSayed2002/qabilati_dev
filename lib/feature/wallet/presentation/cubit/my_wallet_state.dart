part of 'my_wallet_cubit.dart';

@immutable
sealed class MyWalletState {}

final class MyWalletInitial extends MyWalletState {}

final class MyWalletLoading extends MyWalletState {}

final class MyWalletSuccess extends MyWalletState {
  final MywalletModel wallet;
  MyWalletSuccess({required this.wallet});
}

final class MyWalletError extends MyWalletState {}

final class GetUrlLoading extends MyWalletState {}

final class GetUrlSuccess extends MyWalletState {
  final String url;
  GetUrlSuccess({required this.url});
}

final class GetUrlError extends MyWalletState {}

final class PaymentLoading extends MyWalletState {}

final class PaymentSuccess extends MyWalletState {}

final class PaymentError extends MyWalletState {}
