import 'package:flutter/material.dart';

class ActionButtonWidget extends StatefulWidget {
  const ActionButtonWidget({super.key, required this.iconData, this.color});
  final IconData iconData;

  final Color? color;
  @override
  State<ActionButtonWidget> createState() => _ActionButtonWidgetState();
}

class _ActionButtonWidgetState extends State<ActionButtonWidget> {
  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {},
      icon: Icon(
        widget.iconData,
        color: widget.color ?? Colors.black,
        size: 20.0,
      ),
    );
  }
}
