import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:coders_calendar/database/db_functions.dart';
import 'package:coders_calendar/widgets/signup_widget.dart';
import 'package:flutter/material.dart';
class WarningDialogWidget{

  dialogWidget(BuildContext context,String title)
  {
    return AwesomeDialog(
      context: context,
      dialogType: DialogType.ERROR,
      headerAnimationLoop: false,
      animType: AnimType.BOTTOMSLIDE,
      title: title,
      buttonsTextStyle: const TextStyle(color: Colors.black),
      showCloseIcon: true,
      borderSide: BorderSide(width: 2.0, color: Colors.red),
    ).show();

  }
}