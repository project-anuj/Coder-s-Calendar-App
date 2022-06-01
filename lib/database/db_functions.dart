import 'package:coders_calendar/database/db_helper.dart';

class DBFunctions{


  final dbhelper = DatabaseHelper.instance;

  void insertData(String title,String date,String time,String start_time)async{
    Map<String,dynamic> row = {
      DatabaseHelper.columnTitle : title,
      DatabaseHelper.columnDate : date,
      DatabaseHelper.columnTime : time,
      DatabaseHelper.columnStartTime : start_time
    };
    final id = await dbhelper.insert(row);
    print('id : $id'  );
  }
  queryAll() async{
    var allrows = await dbhelper.queryAll();
    allrows?.forEach((row) {
      print(row);
      // print(row['column_title']);

    });
    return allrows;
  }
  void querySpecific()async{
    var allrows = await dbhelper.querySpecific(2);
    print(allrows);
  }
  void delete(int colId) async{
    var id = await dbhelper.deletedata(colId);
    print(id);
  }
  void update()async{
    var row = await dbhelper.update(1);
    print(row);
  }
  Future<bool> count(String title)async{
    int? cnt = await dbhelper.getcount(title);
    return cnt==0? true:false;
  }
}