import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

extension CupertinoModelPopup on BuildContext {
  cupertinoModelPopup({required Widget widget}) {
    return showCupertinoModalPopup(
        context: this, builder: (context) => widget);
  }
}
