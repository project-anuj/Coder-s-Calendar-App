import 'package:flutter/material.dart';

class TimeBox{
  Widget timeBox()
  {
    return Form(child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        SizedBox(
            width: 100.0,

            child: TextFormField(
              decoration: InputDecoration(
                labelText: "Hr",

                labelStyle: TextStyle(
                  fontWeight: FontWeight.bold,
                ),

                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25.0),
                ),
              ),
            )),
        SizedBox(
            width: 100.0,

            child: TextFormField(
              decoration: InputDecoration(
                labelText: "Min",

                labelStyle: TextStyle(
                  fontWeight: FontWeight.bold,
                ),

                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25.0),

                ),
              ),
            )),

      ],
    )
    );
  }
}