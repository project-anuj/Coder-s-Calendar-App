import 'dart:async';

import 'package:coders_calendar/pages/homepage.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 3), ()=>Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_)=>HomePage())));
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xff8066cc),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            // mainAxisSize: MainAxisSize.min,
            children: [
              CircleAvatar(
                child: Image.asset('lib/assets/images/splash_Screen.png'),
                radius: 130,
              ),
              // SizedBox(height:,),
              CircularProgressIndicator(
                color: Colors.black,
              )
            ],
          ),
        ),
      ),
    );
  }
}
