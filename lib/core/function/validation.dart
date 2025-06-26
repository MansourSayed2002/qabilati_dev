import 'package:flutter/material.dart';
import 'package:qabilati/generated/l10n.dart';

validationField(BuildContext context, String type, int min, int max, value) {
  if (type == "Phone") {
    if (!RegExp(r'^01[0-2,5][0-9]{8}$').hasMatch(value)) {
      return S.of(context).correct_phone;
    }
  }
  if (type == "text") {
    if (!RegExp(r'^[a-zA-Z ]*$').hasMatch(value)) {
      return S.of(context).correct_name;
    }
  }
  if (type == "email") {
    if (!RegExp(
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$',
    ).hasMatch(value)) {
      return S.of(context).correct_email;
    }
  }
  if (type == "number") {
    if (!RegExp(r'[!@#<>?":_`~;[\]\\|=+)(*&^%0-9-]').hasMatch(value)) {
      return S.of(context).correct_num;
    }
  }
  if (value.isEmpty) {
    return S.of(context).field_blank;
  } else if (value.length > max) {
    return "${S.of(context).more_than} $max";
  } else if (value.length < min) {
    return "${S.of(context).less_than} $min";
  }
}
