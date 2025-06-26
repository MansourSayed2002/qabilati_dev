import 'package:flutter/material.dart';
import 'package:qabilati/core/service/service_app.dart';
import 'package:qabilati/qabilati_app.dart';

GlobalKey<NavigatorState> navigatorKeydev = GlobalKey<NavigatorState>();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await ServiceApp.init(navigatorKeydev);
  runApp(QabilatiApp(navigatorKey: navigatorKeydev));
}
