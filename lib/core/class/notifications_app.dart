import 'dart:convert';
import 'dart:developer';
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:googleapis_auth/auth_io.dart' as auth;
import 'package:qabilati/core/class/local_storage.dart';
import 'package:qabilati/core/class/supabase_connect.dart';

class NotificationsApp {
  // It used to Access token to Use send notification
  static Future<String> getAccessToken() async {
    final jsonString = await rootBundle.loadString(
      'asset/json/qabilati-dev-bc272-03fddbb4fd7b.json',
    );

    final accountCredentials = auth.ServiceAccountCredentials.fromJson(
      jsonString,
    );

    final scopes = ['https://www.googleapis.com/auth/firebase.messaging'];
    final client = await auth.clientViaServiceAccount(
      accountCredentials,
      scopes,
    );
    client.close();

    return client.credentials.accessToken.data;
  }

  static Future<void> sendNotification({
    required String token,
    required String title,
    required String body,
    required int receiver,
  }) async {
    final String accessToken = await getAccessToken();
    final String fcmUrl = dotenv.env['FCM_URL'].toString();

    final response = await http.post(
      Uri.parse(fcmUrl),
      headers: <String, String>{
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $accessToken',
      },
      body: jsonEncode(<String, dynamic>{
        'message': {
          'token': token,
          'notification': {'title': title, 'body': body},
        },
      }),
    );

    if (response.statusCode == 200) {
      try {
        await SupabaseConnect.supabase.from("notification").insert({
          "notifi_title": title,
          "notifi_content": body,
          "notifi_sender": LocalStorageApp.getHiveData("user_data")['user_id'],
          "notifi_receiver": receiver,
        });
      } catch (e) {
        log(e.toString());
      }
      log('Notification sent successfully');
    } else {
      log('Failed to send notification: ${response.body}');
    }
  }
}
