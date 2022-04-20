import 'package:flutter/material.dart';
class ButtonDesign{
  String text;
  IconData icon;
  ButtonDesign({required this.text,required this.icon});
  Widget button()
  {
    return  Container(
      decoration: BoxDecoration(
        border: Border.all(),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            padding: const EdgeInsets.fromLTRB(
                20, 10, 20, 10),
            child: Text(
              text,
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.fromLTRB(
                0, 10, 20, 10),
            child: Icon(
              icon,
              size: 15,
            ),
          ),
        ],
      ),
    );
  }
}
