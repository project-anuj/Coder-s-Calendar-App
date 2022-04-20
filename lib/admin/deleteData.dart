import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:coders_calendar/widgets/firebaseDialog.dart';
import 'package:coders_calendar/widgets/topic_Items.dart';
import 'package:flutter/material.dart';

class DeleteData extends StatefulWidget {
  const DeleteData({Key? key}) : super(key: key);

  @override
  State<DeleteData> createState() => _DeleteDataState();
}

class _DeleteDataState extends State<DeleteData> {
  final Stream<QuerySnapshot> _userStream = FirebaseFirestore.instance.collection('topics').snapshots();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(title: Text('Delete Data'),),
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
                  onLongPress: ()async{
                    FirebaseDialog().deleteDialogWidget(context,snapshot.data!.docs[index]['title'],snapshot.data!.docs[index].id);
                  },
                  child: TopicItem(title: snapshot.data!.docs[index]['title']).topicItem(),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
