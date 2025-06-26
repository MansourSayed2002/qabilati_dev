import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';
import 'package:qabilati/core/theme/color_app.dart';

class OptWidget extends StatelessWidget {
  const OptWidget({super.key, this.controller, this.validator});
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: Pinput(
        length: 5,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        controller: controller,
        validator: validator,
        errorPinTheme: PinTheme(
          height: 50,
          width: 50,
          decoration: BoxDecoration(
            border: Border.all(color: ColorApp.red),
            shape: BoxShape.circle,
          ),
        ),
        defaultPinTheme: PinTheme(
          height: 60,
          width: 60,
          decoration: BoxDecoration(
            color: ColorApp.white,
            shape: BoxShape.circle,
            border: Border.all(color: ColorApp.grey),
          ),
        ),
        focusedPinTheme: PinTheme(
          height: 60,
          width: 60,
          decoration: BoxDecoration(
            border: Border.all(color: ColorApp.coral),
            shape: BoxShape.circle,
          ),
        ),
      ),
    );
  }
}
