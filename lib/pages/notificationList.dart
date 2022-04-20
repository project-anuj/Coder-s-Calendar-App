import 'package:coders_calendar/database/db_helper.dart';
import 'package:coders_calendar/widgets/buttonDesign.dart';
import 'package:coders_calendar/widgets/dialogBox.dart';
import 'package:flutter/material.dart';

class NotificationList extends StatefulWidget {
  const NotificationList({Key? key}) : super(key: key);

  @override
  State<NotificationList> createState() => _NotificationListState();
}

class _NotificationListState extends State<NotificationList> {
  final dbhelper = DatabaseHelper.instance;
  List<Map<String,dynamic>> _list = <Map<String,dynamic>>[];
  @override
  void initState() {
    super.initState();
    queryAll();
  }
  queryAll() async{
    var allrows = await dbhelper.queryAll();
    allrows?.forEach((row) {
      setState(() {
        _list.add(row);
      });
    });
    return allrows;
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(title: Text('Notification List'),),
        body: ListView.builder(
            itemCount: _list.length,
            itemBuilder: (BuildContext context,int index)
            {
              int sno = index+1;
              String title = _list[index]['column_title'];
              String date = _list[index]['column_date'];
              String time = _list[index]['column_time'];
              int id =  _list[index]['id'];
              return Card(
                child: Container(
                  padding: const EdgeInsets.only(top: 10,bottom: 10,left: 10,right: 10),
                  child:Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [

                      Text(sno.toString()+".  "+title,
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 10,),
                      Text('Date : '+date,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.black54,
                        ),),
                      SizedBox(height: 5,),
                      Text('Time : '+time,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.black54,
                        ),),
                      SizedBox(height: 10,),
                      InkWell(
                          hoverColor: Colors.indigoAccent,
                          onTap: (){
                            DialogWidget().dialogWidget(context, id,title);

                            setState(() {
                              _list.removeAt(index);
                            });
                          },
                          child: ButtonDesign(text: 'Delete Alarm', icon: Icons.auto_delete_outlined).button()),
                    ],
                  ),
                  ),
              );
            }
        ),
      ),
    );
  }

}
