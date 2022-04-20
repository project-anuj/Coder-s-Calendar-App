import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:coders_calendar/pages/contests.dart';
import 'package:coders_calendar/pages/topics.dart';
import 'package:coders_calendar/services/theme_notification_service.dart';
import 'package:coders_calendar/widgets/drawerWidget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var notifyHelper;
  int _currentIndex = 0;
  PageController _pageController = PageController();


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
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
                height: 410,
                width: 250,
                child: Drawer(
                  child: DrawerWidget().drawer(context,notifyHelper),
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
            children: [
              Contests(),
              Topics(),
            ],
          ),
        )
      ),
    );
  }
  @override
  void initState(){
    super.initState();
    _pageController = PageController();
    notifyHelper = NotifyHelper();
    notifyHelper.initializeNotification();
  }
  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }
}
