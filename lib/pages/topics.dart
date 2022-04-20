import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:coders_calendar/pages/interview_tips.dart';
import 'package:coders_calendar/widgets/topic_Items.dart';
import 'package:flutter/material.dart';

class Topics extends StatefulWidget {
  @override
  State<Topics> createState() => _TopicsState();
}

class _TopicsState extends State<Topics> {
  final Stream<QuerySnapshot> _userStream = FirebaseFirestore.instance.collection('topics').snapshots();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream: _userStream,
        builder: (BuildContext context,AsyncSnapshot<QuerySnapshot> snapshot){
          if(snapshot.hasError){
            return Text('Something went wrong');
          }
          if(snapshot.connectionState == ConnectionState.waiting) {
            return Text('Loading...');
          }
          return ListView.builder(
            primary: false,
            scrollDirection: Axis.vertical,
            itemCount: snapshot.data!.docs.length,
            itemBuilder: (BuildContext context,int index){
              return  GestureDetector(
                onTap: (){
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) =>InterviewTips(topic: snapshot.data!.docs[index]['title'],)));
                },
                child: TopicItem(title: snapshot.data!.docs[index]['title']).topicItem(),
              );
            },
          );
        },
      ),
    );
  }
}
