import 'package:coders_calendar/database/db_functions.dart';
import 'package:coders_calendar/functions/functions.dart';
import 'package:coders_calendar/pages/contestList.dart';
import 'package:coders_calendar/pages/signUp_signIn.dart';
import 'package:coders_calendar/services/notification_service.dart';
import 'package:coders_calendar/widgets/alarmDialog.dart';
import 'package:coders_calendar/widgets/buttonDesign.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:share_plus/share_plus.dart';
import 'package:shimmer/shimmer.dart';
import 'package:coders_calendar/functions/functions.dart';

class ContestListWidget{
  Widget contestUi(context,url,name,date,time,duration,status,seconds){
    return Card(
      // shadowColor: Get.isDarkMode?Colors.black54:Color(0x802196F3),
      elevation: 10,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            InkWell(
              onTap: (){
                Functions().launchURL(url);
              },
              child: Column(
                crossAxisAlignment:
                CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 22,
                    ),
                  ),
                  Text(
                    "Date : " +
                        date,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.blueGrey,
                    ),
                  ),
                  Text(
                    "Time : " +
                        time,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.blueGrey,
                    ),
                  ),
                  Row(

                    children: [
                      Text(
                        "Duration : " +
                            duration+
                            " hr",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.blueGrey,
                        ),
                      ),
                      SizedBox(width: 20,),
                      Align(
                        alignment: Alignment.centerRight,
                        child: Shimmer.fromColors(
                            child: status ==
                                'CODING'
                                ? Text(
                              'LIVE',
                              style: TextStyle(
                                color: Colors.red,
                              ),
                            )
                                : Text(
                              'UPCOMING',
                              style: TextStyle(
                                color: Colors.red,
                              ),
                            ),
                            baseColor: Colors.red,
                            highlightColor: Colors.yellow),
                      ),
                    ],
                  ),

                ],
              ),
            ),
            SizedBox(height: 10,),
            Row(
              children: [
                InkWell(
                  onTap: () async {
                    await Share.share(
                      url,
                      subject: 'Download ',
                    );
                  },
                  child: ButtonDesign(text: 'Share',icon: Icons.share).button(),
                ),
                SizedBox(
                  width: 10,
                ),
                GestureDetector(
                  onTap: (){
                    // NotificationService().scheduleNotification(name,seconds);
                    // AlarmDialog().dialogWidget(context,0,name);
                    // DBFunctions().insertData(name,
                    //     date,
                    //     time);
                    print("Hello");
                    showDialog(context: context,
                        builder:(_)=>Dialog(
                          backgroundColor: Colors.transparent,
                          insetPadding: EdgeInsets.only(left: 15,right: 15),
                          child: SignUpSignIn(),
                          // clipBehavior: Clip.antiAliasWithSaveLayer,
                        ));
                  },
                  child: ButtonDesign(text: 'Notify Me',icon: Icons.notifications_active_outlined).button(),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

}