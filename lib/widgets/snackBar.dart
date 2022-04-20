import 'package:flutter/material.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';
class SnackBarItem{
  BuildContext context;
  SnackBarItem({required this.context});
  snackBar(message,color){
    return showTopSnackBar(
      context,
      CustomSnackBar.success(
        backgroundColor: color,
        textStyle: TextStyle(
          fontWeight: FontWeight.bold,
          color: Colors.white,
          fontSize: 18,
        ),
        message:
        message,
      ),
    );
  }
}