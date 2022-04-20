import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TopicItem{
  String title;
  TopicItem({required this.title});
  topicItem()
  {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(22.0)),
      // shadowColor: Get.isDarkMode?Colors.black54:Color(0xff802196F3),
      elevation: 5,
      child: SizedBox(
        height: 126,
        child: Center(
          child: Text(title,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
          ),
        ),
      ),
    );
  }
}