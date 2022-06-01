import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:coders_calendar/pages/contests.dart';
import 'package:coders_calendar/pages/signUp_signIn.dart';
import 'package:coders_calendar/pages/topics.dart';
import 'package:coders_calendar/profile/profiles.dart';
import 'package:coders_calendar/services/theme_notification_service.dart';
import 'package:coders_calendar/widgets/drawerWidget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  int _currentIndex = 0;
  late String? userEmail = null;
  PageController _pageController = PageController();
  int drawerHeight = 450;


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Stack(
        children: [
          Scaffold(
              appBar: AppBar(title: Text('CODER\'S CALENDAR',),
              ),
              drawer:GestureDetector(
                onTap: (){
                  setState(() {

                  });
                },
                onSecondaryTap: (){
                  setState(() {

                  });
                },
                child: Align(
                  alignment: Alignment.topLeft,
                  child: ClipRRect(
                    borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(40),
                    ),
                    child: SizedBox(
                      height:460
                      ,
                      width: 250,
                      child: Drawer(
                        child: DrawerWidget(),
                      ),
                    ),
                  ),
                ),
              ),
              bottomNavigationBar: BottomNavyBar(
                selectedIndex: _currentIndex,
                showElevation: true,
                curve: Curves.easeIn,
                onItemSelected: (index)=> setState(() {
                  _currentIndex=index;
                  _pageController.jumpToPage(index);
                }),
                items:<BottomNavyBarItem> [
                  BottomNavyBarItem(icon: Icon(Icons.emoji_events_outlined),
                    title: Text('Contests',
                    ),
                    // activeColor: Colors.deepPurple,
                    inactiveColor: Colors.black,
                    textAlign: TextAlign.center,
                  ),
                  BottomNavyBarItem(icon: Icon(Icons.article),
                    title: Text('Tips & Links'),
                    // activeColor: Colors.deepPurple,
                    inactiveColor: Colors.black,
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
              body: SizedBox.expand(
                child: PageView(
                  controller: _pageController,
                  onPageChanged: (index){
                    setState(() {
                      _currentIndex=index;
                    });
                  },
                  children:[
                    Contests(),
                      Topics(),
                  ],
                ),
              )
          ),
          // Container(
          //   color: Colors.black54,
          // ),
          // Align(
          //   alignment: Alignment.center,
          //   child: Container(
          //     padding: EdgeInsets.only(left: 15,right: 15),
          //     child: SignUpSignIn(),
          //   ),
          // ),
        ],
      )
    );
  }
  @override
  void initState(){
    super.initState();
    getSharedPref();
    _pageController = PageController();
  }
  getSharedPref()async{
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      userEmail = prefs.getString('userEmail');
    });
  }
  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }
}
