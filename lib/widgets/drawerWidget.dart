import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:coders_calendar/admin/authUi.dart';
import 'package:coders_calendar/functions/functions.dart';
import 'package:coders_calendar/pages/notificationList.dart';
import 'package:coders_calendar/services/theme_services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:share_plus/share_plus.dart';
class DrawerWidget{

    Widget drawer(BuildContext context,var notifyHelper)
    {
      return ListView(
        children: [
          Container(
            decoration: BoxDecoration(
              color: Colors.indigo,
              border: Border.all(color: Colors.indigo),
            ),
            child: DrawerHeader(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const[

                  // SizedBox(
                  //   height: 50,
                  // ),
                  Center(
                    child: Text(
                      "CODER'S CALENDAR",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Center(
                    child: Text(
                      "Never miss a chance",
                      style: TextStyle(
                        color: Colors.white,
                        // fontWeight: FontWeight.bold,
                        fontSize: 14,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Center(
                    child: CircleAvatar(
                      backgroundColor: Colors.indigoAccent,
                      child: Text('A'),
                    ),
                  )
                ],
              ),
            ),
          ),
          ListTile(
            title: Text('Get Notified'),
            trailing: Icon(Icons.notifications_active),
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context)=>NotificationList()));
            },
          ),
          ListTile(
            title: Text('Dark Mode'),
            trailing: Icon(Icons.dark_mode),
            onTap: () {
                    ThemeServices().switchTheme();
                    notifyHelper.displayNotification(
                      title:"Theme Changed",
                      body: Get.isDarkMode?"Activated Light Theme":"Activated Dark Theme"
                    );
                    // notifyHelper.scheduledNotification();
                },
          ),
          ListTile(
            title: Text('Admin'),
            trailing: Icon(Icons.admin_panel_settings_sharp),
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context)=>AuthUI()));
            },
          ),
          ListTile(
            title: Text('Sign Out'),
            trailing: Icon(Icons.logout),
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context)=>AuthUI()));
            },
          ),
          // ListTile(
          //   title: Text('Rate App'),
          //   trailing: Icon(Icons.star),
          //   // trailing: Transform.translate(
          //   //   offset: Offset(
          //   //       -MediaQuery.of(context).size.width * 0.03, 0),
          //   //   child: Icon(Icons.star_rate),
          //   // ),
          //   onTap: (){
          //     Functions().launchURL('https://play.google.com/store/apps/details?id=com.student.testing');
          //   },
          // ),
          // ListTile(
          //   title: Text('Share App'),
          //   trailing: Icon(Icons.share),
          //   // trailing: Transform.translate(
          //   //     // offset: Offset(
          //   //     //     -MediaQuery.of(context).size.width * 0.15, 0),
          //   //     child: Icon(Icons.share)),
          //   onTap:  () async {
          //     await Share.share(
          //      'https://play.google.com/store/apps/details?id=com.student.testing',
          //       subject: 'Download ',
          //     );
          //   },
          // ),
        ],
      );
    }
}