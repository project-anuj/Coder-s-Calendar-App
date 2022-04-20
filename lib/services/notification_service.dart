import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:timezone/data/latest.dart' as tz;
import 'package:timezone/timezone.dart' as tz;


class NotificationService extends ChangeNotifier{
  final FlutterLocalNotificationsPlugin _flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
  
  //initialize
  
  Future initialize()async{
    FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

    AndroidInitializationSettings androidInitializationSettings = AndroidInitializationSettings('app_icon');

    IOSInitializationSettings iosInitializationSettings = IOSInitializationSettings();

    final InitializationSettings initializationSettings = InitializationSettings(
      android: androidInitializationSettings,
      iOS: iosInitializationSettings
    );
    tz.initializeTimeZones();
    await _flutterLocalNotificationsPlugin.initialize(initializationSettings,
    );

  }
  //Scheduled Notification

  Future scheduleNotification(String title,int seconds) async{
    AndroidNotificationDetails _androidNotificationDetails =
    AndroidNotificationDetails(
      'channel ID',
      'channel name',
      playSound: true,
      channelShowBadge: true,
      priority: Priority.max,
      importance: Importance.max,
      enableLights: true,
      enableVibration: true,
      largeIcon: DrawableResourceAndroidBitmap("app_icon"),
        styleInformation: MediaStyleInformation(
            htmlFormatContent: true,
            htmlFormatTitle: true
        ),

      color: Colors.white,
    );
    NotificationDetails platformChannelSpecifics = NotificationDetails(
        android: _androidNotificationDetails);
   await _flutterLocalNotificationsPlugin.zonedSchedule(
       0,
       title,
       "Contest Starts in 10 min",
       tz.TZDateTime.now(tz.local).add(Duration(seconds: seconds)),
       platformChannelSpecifics,
       uiLocalNotificationDateInterpretation: UILocalNotificationDateInterpretation.absoluteTime,
       androidAllowWhileIdle: true,
   );
  }

  //Cancel Notification
  Future cancelNotification()async{
    await _flutterLocalNotificationsPlugin.cancel(0);
  }
}