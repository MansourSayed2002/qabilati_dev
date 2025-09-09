import 'package:flutter/material.dart';
import 'package:qabilati/core/shared/arrow_back_widget.dart';
import 'package:qabilati/generated/l10n.dart';

class MyWalletScreen extends StatelessWidget {
  const MyWalletScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(S.of(context).wallet),
        leading: ArrowBackWidget(),
      ),
      body: CustomBody(),
    );
  }
}

class CustomBody extends StatelessWidget {
  const CustomBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          
        ],
      ),
    );
  }
}
