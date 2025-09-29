import 'package:flutter/material.dart';
import 'package:qabilati/feature/wallet/presentation/widget/recent_transaction_widegt.dart';

class SkeletonizerLoadingWidget extends StatelessWidget {
  const SkeletonizerLoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 10,
      physics: BouncingScrollPhysics(),
      itemBuilder: (context, index) {
        return TransactionCardWidget(
          date: "",
          paymentBy: "",
          amount: "",
          currency: "",
        );
      },
    );
  }
}
