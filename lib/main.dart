import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';
import 'package:dream_app/view/Home/HomeScreen.dart';
import 'package:dream_app/view/StartScreen/StartScreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,

      // إعدادات اللغة والتهيئة
      locale: const Locale('ar'),
      fallbackLocale: const Locale('ar'),
      supportedLocales: const [Locale('ar')],

      // مندوبو التوطين المطلوبون
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],

      // اتجاه النص (يمين لليسار للعربية)
      textDirection: TextDirection.rtl,

      title: 'تطبيقي',
      theme: ThemeData(
        fontFamily: "readexPro",
        primarySwatch: Colors.blue,

        // إعدادات إضافية لدعم اللغة العربية
        textTheme: const TextTheme(
          bodyLarge: TextStyle(fontFamily: "readexPro"),
          bodyMedium: TextStyle(fontFamily: "readexPro"),
        ),
      ),
      home: StartScreen(),
    );
  }
}