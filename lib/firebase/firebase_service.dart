import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:coders_calendar/widgets/firebaseDialog.dart';
import 'package:flutter/material.dart';

class FirebaseService{

  CollectionReference topicsRef = FirebaseFirestore.instance.collection('topics');
  DocumentReference  tipsDocRef = FirebaseFirestore.instance.collection('tips').doc('5hGLo2QRAuAFyXI9fxW3');
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


}