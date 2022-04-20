import 'package:coders_calendar/admin/addData.dart';
import 'package:coders_calendar/admin/deleteData.dart';
import 'package:coders_calendar/firebase/firebase_auth.dart';
import 'package:flutter/material.dart';
class AdminPanel extends StatefulWidget {
  const AdminPanel({Key? key}) : super(key: key);

  @override
  State<AdminPanel> createState() => _AdminPanelState();
}

class _AdminPanelState extends State<AdminPanel> {

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(title: Text('Admin Panel'),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.indigoAccent),
                ),
                onPressed: (){
                  FirebaseAuthService().signout(context);
                },
                child: Text('Sign Out')),
          ),
          SizedBox(width: 10,),
        ],
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(onPressed: (){
                Navigator.of(context).push(MaterialPageRoute(builder: (_)=>AddData()));
              }, child: Text('Add Data to Firebase')),
              SizedBox(height: 20,),
              ElevatedButton(onPressed: (){
                Navigator.of(context).push(MaterialPageRoute(builder: (_)=>DeleteData()));
              }, child: Text('Delete Data From Firebase')),
            ],
          ),
        ),
      ),
    );
  }
}
