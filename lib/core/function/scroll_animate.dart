import 'package:flutter/widgets.dart';

void scrollToBottom(ScrollController scrollController) {
  scrollController.animateTo(
    scrollController.position.maxScrollExtent,
    duration: Duration(milliseconds: 300),
    curve: Curves.easeOut,
  );
}
