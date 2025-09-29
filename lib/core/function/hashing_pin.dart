import 'dart:convert';

import 'package:crypto/crypto.dart';

String hashingPin(String pin) {
  final bytes = utf8.encode(pin);
  return sha256.convert(bytes).toString();
}
