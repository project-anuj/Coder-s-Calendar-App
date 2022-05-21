import 'package:coders_calendar/database/db_functions.dart';
import 'package:coders_calendar/firebase/firebase_service.dart';
import 'package:coders_calendar/functions/functions.dart';
import 'package:coders_calendar/pages/contestList.dart';
import 'package:coders_calendar/pages/signUp_signIn.dart';
import 'package:coders_calendar/services/notification_service.dart';
import 'package:coders_calendar/web_view/webview.dart';
import 'package:coders_calendar/widgets/alarmDialog.dart';
import 'package:coders_calendar/widgets/buttonDesign.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:share_plus/share_plus.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shimmer/shimmer.dart';
import 'package:coders_calendar/functions/functions.dart';

class ContestListWidget extends StatefulWidget {
  String url;
  String name;
  String date;
  String time;
  String duration;
  String status;
  ContestListWidget({required this.url,
  required this.name,
  required this.date,
  required this.time,
  required this.duration,
  required this.status,
  });

  @override
  State<ContestListWidget> createState() => _ContestListWidgetState();
}

class _ContestListWidgetState extends State<ContestListWidget> {
  late String? userEmail = null;
  @override
  void initState(){
    super.initState();
    getSharedPref();
  }
  getSharedPref()async{
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      userEmail = prefs.getString('userEmail');
    });
  }
  @override
  Widget build(BuildContext context) {
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
               Navigator.of(context).push(MaterialPageRoute(builder: (_)=> WebViewPage(url: widget.url, title: widget.name)));
                // Functions().launchURL(widget.url);
              },
              child: Column(
                crossAxisAlignment:
                CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.name,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 22,
                    ),
                  ),
                  Text(
                    "Date : " +
                        widget.date,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.blueGrey,
                    ),
                  ),
                  Text(
                    "Time : " +
                        widget.time,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.blueGrey,
                    ),
                  ),
                  Row(

                    children: [
                      Text(
                        "Duration : " +
                            widget.duration+
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
                            child: widget.status ==
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
                      widget.url,
                      subject: 'Download ',
                    );
                  },
                  child: ButtonDesign(text: 'Share',icon: Icons.share).button(),
                ),
                SizedBox(
                  width: 10,
                ),
                GestureDetector(
                  onTap: ()async {
                    // NotificationService().scheduleNotification(name,seconds);
                    // AlarmDialog().dialogWidget(context,0,name);
                    // DBFunctions().insertData(name,
                    //     date,
                    //     time);
                    // print("Hello");


                    print(userEmail);
                    userEmail == null ?showDialog(context: context,
                        builder:(_)=>Dialog(
                          backgroundColor: Colors.transparent,
                          insetPadding: EdgeInsets.only(left: 15,right: 15),
                          child: SignUpSignIn(),
                          // clipBehavior: Clip.antiAliasWithSaveLayer,
                        )):
                    FirebaseService().addUsers(context,userEmail!, widget.name, widget.date, widget.time);
                    // DBFunctions().insertData(widget.name,
                    //     widget.date,
                    //     widget.time);
                    setState(() {
                      getSharedPref();
                    });
                  },
                  child: ButtonDesign(text: 'Notify Me',
                      icon: Icons.notifications_active_outlined).button(),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

// class ContestListWidget{
//
//
//   Widget contestUi(context,url,name,date,time,duration,status,seconds,userEmail){
//     return
//   }
//
// }