import 'dart:async';
import 'package:digital_banking/controller/network_binding.dart';
import 'package:digital_banking/screens/AuthPage/Login/login.dart';
import 'package:digital_banking/screens/AuthPage/SignUp/address1.dart';
import 'package:digital_banking/screens/AuthPage/SignUp/dojahVerify.dart';
import 'package:digital_banking/screens/AuthPage/SignUp/email.dart';
import 'package:digital_banking/screens/AuthPage/SignUp/password.dart';
import 'package:digital_banking/screens/dashBoardPage/dashBordPage/dashBoardPage.dart';
import 'package:digital_banking/screens/introScreen/introScreen.dart';
import 'package:digital_banking/screens/qrdemo.dart';
import 'package:digital_banking/screens/splashScreen/splashScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(statusBarColor: Colors.transparent));
  runApp(GetMaterialApp(
    builder: EasyLoading.init(),
    initialBinding: NetworkBinding(),
    debugShowCheckedModeBanner: false,
    home: const MyApp(),
    theme: ThemeData(
      appBarTheme: AppBarTheme(
        brightness: Brightness.dark,
        systemOverlayStyle: SystemUiOverlayStyle.dark, // 2

      ),
    ),
  ));
}
void configLoading() {
  EasyLoading.instance
    ..displayDuration = const Duration(milliseconds: 2000)
    ..indicatorType = EasyLoadingIndicatorType.fadingCircle
    ..loadingStyle = EasyLoadingStyle.custom
    ..indicatorSize = 45.0
    ..radius = 10.0
    ..progressColor = Colors.white
    ..indicatorColor = Colors.white
    ..backgroundColor = Color(0xFF0057FC)
    ..textColor = Colors.white
    ..maskColor = Colors.blue.withOpacity(0.5);
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  initState() {
    super.initState();

  }
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    return Container(
      child: SplashScreen(),
    );
  }

  navigate() async {
    SharedPreferences share = await SharedPreferences.getInstance();
    bool introScreen = share.getBool('introScreen') ?? false;
    bool loginScreen = share.getBool('loginScreen') ?? false;
    // String loginScreen = share.getBool('loginScreen') ?? false;
    if (introScreen) {
      if (loginScreen) {
        Get.offAll(const DashBoardPage());
      } else {
        Get.to( Login());
      }
    } else {
      Get.offAll(const IntroScreen());
    }
  }
}
