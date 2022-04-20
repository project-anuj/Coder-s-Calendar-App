import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class FirebaseDialog{

  deleteDialogWidget(BuildContext context,String title,String documentId)
  {
    return AwesomeDialog(
      context: context,
      dialogType: DialogType.QUESTION,
      headerAnimationLoop: false,
      animType: AnimType.BOTTOMSLIDE,
      title: "Do you really want to delete \""+ title+"\"",
      buttonsTextStyle: const TextStyle(color: Colors.black),
      showCloseIcon: true,
      btnOkOnPress: () async{
        await FirebaseFirestore.instance.collection('topics').doc(documentId).delete();
        await FirebaseFirestore.instance.collection('tips').doc('5hGLo2QRAuAFyXI9fxW3').collection(title).doc(documentId).delete();
      },
      btnOkColor: Colors.deepOrange,
      btnOkText: "Delete"
    ).show();

  }
  addDialogWidget(BuildContext context)
  {
    return AwesomeDialog(
        context: context,
        dialogType: DialogType.SUCCES,
        headerAnimationLoop: false,
        animType: AnimType.BOTTOMSLIDE,
        title: "Data added Successfully",
        buttonsTextStyle: const TextStyle(color: Colors.black),
        showCloseIcon: true,
        btnOkOnPress: () {
             },
        btnOkText: "Ok"

    ).show();

  }
}