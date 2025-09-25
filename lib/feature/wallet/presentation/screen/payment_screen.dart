import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:qabilati/core/extension/message_bar.dart';
import 'package:qabilati/core/extension/navigator_app.dart';
import 'package:qabilati/core/get_it/get_it.dart';
import 'package:qabilati/feature/wallet/presentation/cubit/my_wallet_cubit.dart';
import 'package:qabilati/feature/wallet/presentation/screen/my_wallet_screen.dart';
import 'package:qabilati/generated/l10n.dart';

class PaymentScreen extends StatefulWidget {
  const PaymentScreen({super.key, required this.url, required this.balance});
  final String url;
  final int balance;
  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  InAppWebViewController? webController;

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: getIt<MyWalletCubit>(),
      child: Scaffold(
        appBar: AppBar(title: const Text("Complete Payment")),
        body: BlocConsumer<MyWalletCubit, MyWalletState>(
          buildWhen:
              (previous, current) =>
                  current is PaymentLoading ||
                  current is PaymentSuccess ||
                  current is PaymentError,
          listener: (context, state) {
            if (state is PaymentSuccess) {
              context.pop();
              context.pushRepalceMent(MyWalletScreen());
            } else if (state is PaymentError) {
              context.messageBar(S.of(context).message_error);
            }
          },
          builder: (context, state) {
            return InAppWebView(
              onWebViewCreated: (controller) {
                webController = controller;
                webController?.loadUrl(
                  urlRequest: URLRequest(url: WebUri(widget.url)),
                );
              },
              onLoadStop: onLoadStop,
            );
          },
        ),
      ),
    );
  }

  void onLoadStop(InAppWebViewController controller, WebUri? url) async {
    if (url == null) return;
    final uri = Uri.parse(url.toString());
    if (uri.path.contains('payment-status')) {
      final trxId = uri.queryParameters['trx_id'];
      await getIt<MyWalletCubit>().fetchPaymentMethodInfo(
        orderId: int.tryParse(trxId ?? "0") ?? 0,
        currentBalance: widget.balance,
      );
    }
  }
}
