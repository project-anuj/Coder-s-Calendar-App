import 'dart:convert';

import 'package:coders_calendar/other_pages/api_keys.dart';
import 'package:coders_calendar/pages/signUp_signIn.dart';
import 'package:coders_calendar/services/notification_service.dart';
import 'package:coders_calendar/widgets/contest_list_widget.dart';
import 'package:flutter/material.dart';
import 'package:coders_calendar/functions/functions.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class ContestList extends StatefulWidget {
  String platformName;
  String url;
  String contestList;
  ContestList({required this.platformName,required this.url,required this.contestList});

  @override
  _ContestListState createState() => _ContestListState();
}

class _ContestListState extends State<ContestList> with WidgetsBindingObserver{

  late List list=[];
  late String? userEmail = "";
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance!.addObserver(this);
    getContest(widget.url, widget.contestList);
    getSharedPref();
    sortList(list);
  }
  getSharedPref()async{
    final prefs = await SharedPreferences.getInstance();
   setState(() {
     userEmail = prefs.getString('userEmail');
     userEmail ??= "";
   });
  }
  sortList(contestList)
  {
    contestList.sort((a, b) {
      return b['status']
          .toString()
          .toUpperCase()
          .compareTo(a['status'].toString().toUpperCase());
    });
  }
  Future<String> getContest(String websiteUrl,String selectedContestList) async{
    var response = await http.get(Uri.parse(websiteUrl),
        headers: {"Accept":"application/json"}
    );
    setState(() {
      var convertToJson = jsonDecode(response.body);
      list=convertToJson;
    });
    return 'Success';
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Stack(
        children: [
          Scaffold(
          appBar: AppBar(
            title: Text(widget.platformName),
            // backgroundColor: Colors.indigo,
          ),
          body:
          // (widget.contestList.length == 0) || (widget.contestList.length == null)
          (list.isEmpty)||( list==null)
            ? Center(
                child: CircularProgressIndicator(),
              )
              : ListView.builder(
                  itemCount: list.length,
                  itemBuilder: (BuildContext context, int index) {
                    String url,name,date,time,duration,status,start_time;
                    if(widget.platformName=='CODECHEF' || widget.platformName=='All in One')
                      {
                        url = list[index]['url'];

                        name =  list[index]['name'];
                        String startTime = list[index]['start_time'];
                         start_time = startTime.substring(0,10)+'T'+startTime.substring(11,19)+'.000z';
                        // print(start_time);
                        date = Functions().getDate(start_time);
                        time = Functions().getTime(start_time);
                        duration = Functions().getDuration(list[index]['duration']);
                        status = list[index]['status'];
                      }
                    else{
                      url = list[index]['url'];
                      name =  list[index]['name'];
                      start_time = list[index]['start_time'];
                      date = Functions().getDate(list[index]['start_time']);
                      time = Functions().getTime(list[index]['start_time']);
                      duration = Functions().getDuration(list[index]['duration']);
                      status = list[index]['status'];
                    }

                    // DateTime curr = DateTime.now().toUtc().toLocal();
                    // DateTime startDate = DateTime.parse(list[index]['start_time']).toUtc().toLocal();
                    // int timeDiffInSecond = startDate.difference(curr).inSeconds;
                    //
                    int timeDiffInSecond=60;

                    return ContestListWidget(url: url, name: name, date: date, time: time, duration: duration, status: status,start_time: start_time);
                  }),
        ),
         //  Container(
         //    color: Colors.black54,
         //  ),
         // Align(
         //    alignment: Alignment.bottomCenter,
         //    child: SignUpSignIn(),
         //  )
    ]
      ),
    );
  }
  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);
    // switch(state) {
    //   case AppLifecycleState.resumed:
    //     print("Hello anuj 1");
    //     break;
    // }
    print("Anuj ->" +state.toString());
  }

  @override
  void dispose() {
    WidgetsBinding.instance!.removeObserver(this);
    super.dispose();
  }
}
