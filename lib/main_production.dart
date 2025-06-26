import 'package:flutter/material.dart';
import 'package:qabilati/core/service/service_app.dart';
import 'package:qabilati/qabilati_app.dart';

GlobalKey<NavigatorState> navigatorKeypro = GlobalKey<NavigatorState>();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await ServiceApp.init(navigatorKeypro);
  runApp(QabilatiApp(navigatorKey: navigatorKeypro));
}
