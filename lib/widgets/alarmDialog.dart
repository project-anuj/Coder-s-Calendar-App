import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';


class AlarmDialog{
  dialogWidget(BuildContext context,int id,String title)
  {
    return AwesomeDialog(
      context: context,
      dialogType: DialogType.SUCCES,
      headerAnimationLoop: false,
      animType: AnimType.BOTTOMSLIDE,
      title: title+" added for notification, Successfully.",
      buttonsTextStyle: const TextStyle(color: Colors.black),
      showCloseIcon: true,
      btnOkOnPress: () {
        // DBFunctions().delete(id);
      },
    ).show();

  }
}