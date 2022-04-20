import 'package:clipboard/clipboard.dart';
import 'package:coders_calendar/functions/functions.dart';
import 'package:coders_calendar/widgets/buttonDesign.dart';
import 'package:coders_calendar/widgets/snackBar.dart';
import 'package:flutter/material.dart';

class TipsItem{
  String sno,title,desc,link;
  BuildContext context;
  TipsItem({required this.sno,required this.title,required this.desc,required this.link,required this.context});
    Widget ui()
    {
       return Card(
         child: Container(
           padding: const EdgeInsets.only(top: 10,bottom: 10,left: 10,right: 10),
           width: MediaQuery.of(context).size.width,
           child: Column(
             mainAxisSize: MainAxisSize.min,
             crossAxisAlignment: CrossAxisAlignment.start,
             children: [

               Text(sno + ".  " +title,
                 style: TextStyle(
                   fontSize: 18,
                   fontWeight: FontWeight.bold,
                 ),
               ),
               SizedBox(height: 15,),
               Text(desc,
                 style: TextStyle(
                   fontWeight: FontWeight.bold,
                   color: Colors.black54,
                 ),),
               SizedBox(height: 15,),
               Row(

                 children: [
                   InkWell(
                       onTap: (){
                         FlutterClipboard.copy(link);
                         SnackBarItem(context: context).snackBar('Link copied successfully!!!',Colors.indigoAccent);
                       },
                       child: ButtonDesign(text: 'Copy Link', icon: Icons.content_copy).button()),
                   SizedBox(width: 10,),
                   InkWell(
                       onTap: (){
                         Functions().launchURL(link);
                       },
                       child: ButtonDesign(text: 'Open Link', icon: Icons.open_in_new).button()),
                 ],
               ),
             ],
           ),
         ),
       );
    }
    item(){
      return Column(
        children: [
            ui(),
        ],
      );
    }
}