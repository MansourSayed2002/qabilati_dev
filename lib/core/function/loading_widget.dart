import 'package:flutter/material.dart';
import 'package:qabilati/core/theme/color_app.dart';

loadingWidget(context) {
  return showDialog(
    barrierDismissible: false,
    context: context,
    builder:
        (context) =>
            Center(child: CircularProgressIndicator(color: ColorApp.coral)),
  );
}
