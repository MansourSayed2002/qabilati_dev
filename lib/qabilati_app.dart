import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qabilati/core/class/local_storage.dart';
import 'package:qabilati/core/theme/theme_app.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:qabilati/feature/intro/splash_screen.dart';
import 'package:qabilati/generated/l10n.dart';

class QabilatiApp extends StatelessWidget {
  const QabilatiApp({super.key, required this.navigatorKey});
  final GlobalKey<NavigatorState> navigatorKey;
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          navigatorKey: navigatorKey,
          localizationsDelegates: [
            S.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: S.delegate.supportedLocales,
          locale: Locale("ar"),
          theme:
              LocalStorageApp.getData("theme") == "dark"
                  ? ThemeApp.dark
                  : ThemeApp.light,
          home: SplashScreen(),
        );
      },
    );
  }
}
