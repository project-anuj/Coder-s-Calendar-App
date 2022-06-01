import 'package:coders_calendar/database/db_helper.dart';
import 'package:coders_calendar/pages/homepage.dart';
import 'package:coders_calendar/pages/signUp_signIn.dart';
import 'package:coders_calendar/profile/profiles.dart';
import 'package:coders_calendar/services/notification_service.dart';
import 'package:coders_calendar/services/theme_notification_service.dart';
import 'package:coders_calendar/services/theme_services.dart';
import 'package:coders_calendar/splash_Screen/splash_screen.dart';
import 'package:coders_calendar/theme/theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get/get.dart';
import 'package:get/get_core/get_core.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get_storage/get_storage.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await GetStorage.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: "coder's calendar app",

      debugShowCheckedModeBanner: false,

      theme: Themes.light,
      darkTheme: Themes.dark,
      themeMode: ThemeServices().theme,
      home: SafeArea(
        child: AnimatedSplashScreen(
          splash: Image.asset('lib/assets/images/splash_Screen.png'),
          splashIconSize: 280,
          backgroundColor: Get.isDarkMode?Colors.black54:Colors.white,
          splashTransition: SplashTransition.scaleTransition,
          nextScreen: HomePage(),
        ),
      )
      // home: UserProfile(),
    );
  }
}