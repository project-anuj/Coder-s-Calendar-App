import 'package:coders_calendar/database/db_helper.dart';
import 'package:coders_calendar/pages/homepage.dart';
import 'package:coders_calendar/pages/signUp_signIn.dart';
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
import 'package:cron/cron.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';

// NotifyHelper notifyHelper = NotifyHelper();
// final dbhelper = DatabaseHelper.instance;
// List<Map<String,dynamic>> _list = <Map<String,dynamic>>[];
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await GetStorage.init();

  // final cron = Cron();
  // var allrows = await dbhelper.queryAll();
  // cron.schedule(Schedule.parse('*/1 * * * * *'), () async=> {
      // print('Every Second')
    // NotificationService().scheduleNotification('title', 5)
  // notifyHelper.displayNotification(
  // title:"Theme Changed",
  // body: Get.isDarkMode?"Activated Light Theme":"Activated Dark Theme+${DateTime.now().second}"
  // )
  // allrows?.forEach((row) {
  //   // print(row);
  //   notifyHelper.displayNotification(
  //     title: row['column_title'].toString(),
  //       body: 'Contest start at : '+row['column_time'].toString(),
  //       // title:"Theme Changed",
  //       // body: Get.isDarkMode?"Activated Light Theme":"Activated Dark Theme+${DateTime.now().second}"
  //       );
  // }),
  // });
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
      // home: HomePage(),
      home: AnimatedSplashScreen(
        splash: Image.asset('lib/assets/images/splash_Screen.png'),
        splashIconSize: 280,
        backgroundColor: Get.isDarkMode?Colors.black54:Colors.white,
        splashTransition: SplashTransition.scaleTransition,
        nextScreen: HomePage(),
      )
      // home: HomePage(),
      // home: SignUpSignIn(),
      // home: SplashScreen(),
    );
  }
}