import 'package:url_launcher/url_launcher.dart';
import 'package:intl/intl.dart';
import 'package:webview_flutter/webview_flutter.dart';

class Functions{
  void launchURL(String url) async{
    if(!await launch(url))
      {
        throw 'Could not launch url';
      }
    else
      {
        launch(url);
      }
  }
  String getDate(String date)
  {
    var dateUtc = DateTime.parse(date).toUtc();
    String dateLocal =  dateUtc.toLocal().toString().substring(0,10);
    return dateLocal.toString()
        .substring(0, 10)
        .toString()
        .split('')
        .reversed
        .join('')
        .toString()
        .split('-')
        .map((item) => item
        .split('')
        .reversed
        .join(''))
        .join('-');
  }
  String convertDate(String date)
  {
    var dateUtc = DateTime.parse(date).toUtc();
    String dateLocal =  dateUtc.toLocal().toString().substring(0,10);
    return dateLocal.toString()
        .substring(0, 19)
        .toString()
        .split('')
        .reversed
        .join('')
        .toString()
        .split('-')
        .map((item) => item
        .split('')
        .reversed
        .join(''))
        .join('-');
  }
  String getTime(String time)
  {
    String dateTime = time.toString().substring(0,19);
    // var dateTime1 = DateTime.parse(dateTime).timeZoneName;
    // print(DateFormat("yyyy-MM-dd HH:mm:ss").parse(utc));
    var dateUtc = DateTime.parse(time).toUtc();
    // print(dateUtc.toLocal());
    // return '';
    return dateUtc.toLocal().toString().substring(11,16);
    // return DateTime.parse(time.substring(0,19)
    //     .toString())
    //     .toUtc()
    //     .toString()
    //     .substring(11, 16)
    //     .toString();
  }
  String getDuration(String duration)
  {
    return Duration(
        seconds: double.parse(duration
            .toString())
            .toInt())
        .toString()
        .substring(
      0,
      Duration(
          seconds: double.parse(duration
              .toString())
              .toInt())
          .toString()
          .lastIndexOf(':'),
    );
  }
}