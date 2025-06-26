import 'dart:developer';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:qabilati/core/constants/image_app.dart';
import 'package:qabilati/core/extension/cupertino_model_popup.dart';
import 'package:qabilati/core/function/image_picker.dart';
import 'package:qabilati/core/theme/color_app.dart';
import 'package:qabilati/core/theme/textstyle_app.dart';
import 'package:qabilati/generated/l10n.dart';

// ignore: must_be_immutable
class ImageWidget extends StatefulWidget {
  ImageWidget({
    super.key,
    this.radius,
    this.isIcon = false,
    this.iconData,
    this.controller,
  });
  final double? radius;
  bool isIcon;
  final IconData? iconData;
  final dynamic controller;
  @override
  State<ImageWidget> createState() => _ImageWidgetState();
}

class _ImageWidgetState extends State<ImageWidget> {
  String? image;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.cupertinoModelPopup(
          widget: CupertinoActionSheet(
            actions: [
              CupertinoActionSheetAction(
                onPressed: () async {
                  image = await imagePicker(false);
                  if (image != null) {
                    widget.isIcon = false;
                    widget.controller.pathImage = image;
                    log(widget.controller.pathImage);
                    setState(() {});
                  }
                },
                child: Text(
                  S.of(context).camera,
                  style: getBodyStyle(context: context),
                ),
              ),
              CupertinoActionSheetAction(
                onPressed: () async {
                  image = await imagePicker(true);
                  if (image != null) {
                    widget.isIcon = false;
                    widget.controller.pathImage = image;
                    log(widget.controller.pathImage);
                    setState(() {});
                  }
                },
                child: Text(
                  S.of(context).gallery,
                  style: getBodyStyle(context: context),
                ),
              ),
            ],
          ),
        );
      },
      child: CircleAvatar(
        radius: widget.radius ?? 100.0,
        backgroundColor: ColorApp.peach,
        backgroundImage:
            widget.isIcon
                ? null
                : image != null
                ? FileImage(File(image!))
                : AssetImage(ImageApp.user),
        child:
            widget.isIcon
                ? Icon(widget.iconData, color: ColorApp.white, size: 30.0)
                : null,
      ),
    );
  }
}
