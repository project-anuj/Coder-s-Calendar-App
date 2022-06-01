import 'package:coders_calendar/constants/strings.dart';
import 'package:coders_calendar/database/db_functions.dart';
import 'package:coders_calendar/web_view/webview.dart';
import 'package:coders_calendar/widgets/buttonDesign.dart';
import 'package:coders_calendar/widgets/warningDialog.dart';
import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shimmer/shimmer.dart';
import 'package:add_2_calendar/add_2_calendar.dart';


class ContestListWidget extends StatefulWidget {
  String url;
  String name;
  String date;
  String time;
  String duration;
  String status;
  String start_time;
  ContestListWidget({required this.url,
  required this.name,
  required this.date,
  required this.time,
  required this.duration,
  required this.status,
    required this.start_time
  });

  @override
  State<ContestListWidget> createState() => _ContestListWidgetState();
}

class _ContestListWidgetState extends State<ContestListWidget> with WidgetsBindingObserver{
  // late String? userEmail = null;
  late bool? isAdded = false;
  late bool? toggle = false;

  @override
  void initState(){
    super.initState();
    WidgetsBinding.instance!.addObserver(this);
    getSharedPref(widget.name);
    toggle = false;
  }
  // getSharedPref()async{
  //   final prefs = await SharedPreferences.getInstance();
  //   setState(() {
  //     userEmail = prefs.getString('userEmail');
  //   });
  // }
  getSharedPref(key)async{
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      isAdded = prefs.getBool(key);
    });
  }
  setSharedPref(key,value)async{
    final prefs = await SharedPreferences.getInstance();
    prefs.setBool(key, value);
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
                            child: (DateTime.parse(widget.start_time).isBefore(DateTime.now()))
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
                 (isAdded ==null || isAdded ==false)?
                 GestureDetector(
                  onTap: (){
                    if(DateTime.parse(widget.start_time).isAfter(DateTime.now()))
                    {
                      print("Anuj1");
                      setState(() {
                        toggle = true;
                      });
                      final Event event = Event(
                        title: widget.name,
                        startDate: getStartTime(),
                        endDate: getStartTime().add(Duration(minutes:getDuration() )),
                        location: widget.url,
                      );
                      setSharedPref(widget.name, true);
                      Add2Calendar.addEvent2Cal(event);
                      DBFunctions().insertData(widget.name,
                          widget.date,
                          widget.time,
                          widget.start_time
                      );
                      print("Anuj2");
                    }
                    else
                      {
                         WarningDialogWidget().dialogWidget(context, Strings().addToCalendarTitle);
                      }
                  },
                  child: Container(
                    color: toggle==true?Colors.greenAccent:Colors.transparent,
                    child: ButtonDesign(text: toggle==false?'Add to Calendar':'Added',
                        icon: toggle==false?Icons.calendar_today: Icons.check).button(),
                  ),
                ):Container(
                   color: Colors.greenAccent,
                  child: ButtonDesign(text: 'Added',
                      icon: Icons.check).button(),
                )

              ],
            ),
          ],
        ),
      ),
    );
  }
  getStartTime(){
    return DateTime.parse(widget.start_time);
  }
  getDuration(){
    int index = widget.duration.indexOf(':');
    return int.parse(widget.duration.substring(0,index))*60 + int.parse(widget.duration.substring(index+1));
  }
  @override
  void dispose() {
    WidgetsBinding.instance!.removeObserver(this);
    super.dispose();
  }
  @override
  void didChangeAppLifecycleState(AppLifecycleState state) async{
    super.didChangeAppLifecycleState(state);
    print("Anuj ->" +state.toString());
    switch(state) {
      case AppLifecycleState.resumed:
        setState(() {

        });
        print("Hello anuj 2");
        break;
    }
  }
}
