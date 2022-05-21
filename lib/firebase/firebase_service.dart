import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:coders_calendar/widgets/firebaseDialog.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FirebaseService{



  CollectionReference topicsRef = FirebaseFirestore.instance.collection('topics');
  DocumentReference  tipsDocRef = FirebaseFirestore.instance.collection('tips').doc('5hGLo2QRAuAFyXI9fxW3');
  DocumentReference  usersDocRef = FirebaseFirestore.instance.collection('users').doc('vxlUCRn9CB5m27KKAcdC');
  Future<void> addTopic(String title){
    return topicsRef.doc(title).set({
      "title": title
    }
    ).then((value) => print("Topics \""+title+"\" added"))
        .catchError((error)=>print("Failed to add topics: $error"));
  }

  Future<void> addTips(BuildContext context,String topicName,String title,String desc,String link){
    return tipsDocRef.collection(topicName).doc(title).set({
        "title":title,
        "desc": desc,
        "link": link
    }).then((value) => FirebaseDialog().addDialogWidget(context))
        .catchError((error)=>print("Failed to add tips: $error"));
  }

  Future<void> addUsers(BuildContext context,String email,String title,String date,String time)async{

    return tipsDocRef.collection(email).doc(title).set({
      "title":title,
      "date": date,
      "time": time
    }).catchError((error)=>print("Failed to add tips: $error"));
  }

}