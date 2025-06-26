import 'dart:async';

import 'package:flutter/material.dart';
import 'package:qabilati/core/enum/type.dart';
import 'package:qabilati/core/extension/navigator_app.dart';
import 'package:qabilati/core/theme/color_app.dart';
import 'package:qabilati/core/theme/textstyle_app.dart';
import 'package:qabilati/feature/auth/presentation/screen/verifycode_screen.dart';
import 'package:qabilati/generated/l10n.dart';

class CounterWidget extends StatefulWidget {
  const CounterWidget({super.key, required this.type});
  final TypeEnum type;
  @override
  State<CounterWidget> createState() => _CounterWidgetState();
}

class _CounterWidgetState extends State<CounterWidget> {
  Duration duration = Duration(seconds: 20);
  Timer? timer;
  @override
  void initState() {
    timer = Timer.periodic(const Duration(seconds: 1), (timer) => minusTime());
    super.initState();
  }

  minusTime() {
    final minusSecond = 1;
    if (duration.inSeconds == minusSecond) {
      timer?.cancel();
    }
    setState(() {
      final seconds = duration.inSeconds - minusSecond;
      duration = Duration(seconds: seconds);
    });
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "00:${duration.inSeconds > 10 ? duration.inSeconds : "0${duration.inSeconds}"}",
        ),
        InkWell(
          onTap: () {
            if (duration.inSeconds == 0) {
              context.pushRepalceMent(VerifycodeScreen(type: widget.type));
            }
          },
          child: Text(
            S.of(context).send_code,
            style: getSmallStyle(color: ColorApp.coral),
          ),
        ),
      ],
    );
  }
}
