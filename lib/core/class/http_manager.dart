import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;

class HttpManager {
  static postMethod({
    required String baseUrl,
    String? body,
    Map<String, String>? headers,
  }) async {
    final result = await http.post(
      Uri.parse(baseUrl),
      headers: headers,
      body: body,
    );
    if (result.statusCode == 201 || result.statusCode == 200) {
      return jsonDecode(result.body);
    } else {
      log(result.request.toString());
      log(result.body.toString());
      log(result.statusCode.toString());
    }
  }
}
