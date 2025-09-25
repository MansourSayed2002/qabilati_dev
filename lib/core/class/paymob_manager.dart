// import 'dart:convert';
// import 'dart:developer';
// import 'package:qabilati/core/class/http_manager.dart';
// import 'package:qabilati/core/constants/link_app.dart';

// class PaymobManager {
//   static Future<String> getPaymentMethod() async {
//     String authanticatioonToken = await _getPaymentMethod();
//     String orderUrl = await _getOrderId(
//       authToken: authanticatioonToken,
//       amount: "20000",
//     );
//     return orderUrl;
//   }

//   static Future<String> _getPaymentMethod() async {
//     try {
//       final result = await HttpManager.postMethod(
//         endPoint: LinkPayMobApp.login,
//         body: jsonEncode({
//           "api_key":

//         }),
//         headers: {"Content-Type": "application/json"},
//       );
//       return result['token'];
//     } catch (e) {
//       log(e.toString());
//       return "";
//     }
//   }

//   static Future<String> _getOrderId({
//     required String authToken,
//     required String amount,
//   }) async {
//     try {
//       final result = await HttpManager.postMethod(
//         endPoint: LinkPayMobApp.createPaymentLink,
//         headers: {
//           "Content-Type": "application/json",
//           "Authorization": "Bearer $authToken",
//         },
//         body: jsonEncode({
//           "delivery_needed": "false",
//           "amount_cents": amount, // 200 EGP
//           "currency": "EGP",
//           "is_live": false,
//           "payment_methods": [5300861],
//           "items": [],
//         }),
//       );
//       return result['client_url'];
//     } catch (e) {
//       log(e.toString());
//       return "";
//     }
//   }
// }
