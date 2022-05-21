import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyItems{
  String image;
  String heading;
  int color;
  MyItems({required this.image,required this.heading,required this.color});
  Material myItems() {
    return Material(
      // color: Colors.white,

      elevation: 2.0,
      // shadowColor: Get.isDarkMode?Colors.black54:Color(0xff802196F3),
      borderRadius: BorderRadius.circular(24.0),
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        heading,
                        style: TextStyle(
                          color:  Color(color),
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  image != ''
                      ? Material(
                    color:  Color(color),
                    borderRadius: BorderRadius.circular(24.0),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      // child: Icon(
                      //   iconData,
                      //   color: Colors.white,
                      //   size: 30.0,
                      // ),
                      child: Image.asset(
                        image,
                        height: 30,
                        width: 30,
                        color: Colors.white,
                      ),
                    ),
                  )
                      : Container(),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

}