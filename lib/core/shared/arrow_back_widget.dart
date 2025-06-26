import 'package:flutter/material.dart';
import 'package:qabilati/core/extension/navigator_app.dart';

class ArrowBackWidget extends StatelessWidget {
  const ArrowBackWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        context.pop();
      },
      icon: Icon(
        Icons.arrow_back_ios_rounded,
        size: Theme.of(context).appBarTheme.iconTheme?.size,
        color: Theme.of(context).appBarTheme.iconTheme?.color,
      ),
    );
  }
}
