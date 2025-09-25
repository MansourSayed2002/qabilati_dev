import 'dart:convert';
import 'dart:developer';

import 'package:crypto/crypto.dart';

String hashingPin(String pin) {
  final bytes = utf8.encode(pin);
  log(sha256.convert(bytes).toString());
  return sha256.convert(bytes).toString();
}
