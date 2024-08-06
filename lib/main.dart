import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get_storage/get_storage.dart';
import 'package:techblog/component/color_Manager.dart';
import 'package:techblog/component/text_style_manager.dart';
import 'package:techblog/my_http_overrides.dart';
import 'package:techblog/view/splash_screen.dart';

void main()async {
  HttpOverrides.global = MyHttpOverrides();


  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: SolidColors.primaryColor,
      systemNavigationBarColor: SolidColors.primaryColor));
  await GetStorage.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      locale: const Locale('fa'),
      title: 'TechBlog',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: SolidColors.primaryColor),
        useMaterial3: true,
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
            textStyle: WidgetStateProperty.resolveWith(
              (states) {
                if (states.contains(WidgetState.pressed)) {
                  return TextStyleManager.elevBtextStyle2;
                }
                return TextStyleManager.elevBtextStyle1;
              },
            ),
            backgroundColor: WidgetStateProperty.resolveWith(
              (states) {
                if (states.contains(WidgetState.pressed)) {
                  return SolidColors.primaryColor;
                }
                return const Color.fromARGB(127, 68, 4, 87);
              },
            ),
          ),
        ),
        inputDecorationTheme: InputDecorationTheme(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(16), borderSide: const BorderSide(width: 4),),
          filled: true,
          fillColor: const Color.fromARGB(55, 175, 174, 175)
        )
      ),
      home: const Splashscreen(),
      // home: const RegisterIntro(),
    );
  }
}
