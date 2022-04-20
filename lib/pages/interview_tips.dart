import 'package:coders_calendar/widgets/tipsItems.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class InterviewTips extends StatefulWidget {
  String topic;
  InterviewTips({required this.topic});
  @override
  State<InterviewTips> createState() => _InterviewTipsState();
}

class _InterviewTipsState extends State<InterviewTips> {
  String coll = '';
  @override
  Widget build(BuildContext context) {
    final Stream<QuerySnapshot> _userStream=FirebaseFirestore.instance.collection('tips').doc('5hGLo2QRAuAFyXI9fxW3').collection(coll).snapshots();
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(title: Text(widget.topic),),
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
              itemCount: snapshot.data!.docs.length,
              itemBuilder: (BuildContext context,int index){
                  return TipsItem(sno: '${index+1}',title: snapshot.data!.docs[index]['title'],
                desc: snapshot.data!.docs[index]['desc'],
                   link: snapshot.data!.docs[index]['link'],
                    context: context,
                ).item();
               },
            );
          },
        ),
        // body: TipsItem().item(),
      ),
    );
  }
  @override
  void initState() {
    super.initState();
    coll = widget.topic;
  }
}
