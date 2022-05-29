import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:coders_calendar/database/db_functions.dart';
import 'package:flutter/material.dart';
class AboutDialogWidget{

  dialogWidget(BuildContext context,String title)
  {
    return AwesomeDialog(
      context: context,
      dialogType: DialogType.INFO,
      headerAnimationLoop: false,
      animType: AnimType.BOTTOMSLIDE,
      title: title,
      buttonsTextStyle: const TextStyle(color: Colors.black),
      showCloseIcon: true,
    ).show();

  }
}