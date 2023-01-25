import 'package:flutter/material.dart';

class IconImg {
  icon() {
    // return SizedBox(
    //   height: 30,
    // )
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          //padding: EdgeInsets.all(20.0),
          alignment: Alignment(0, 10),
          height: 66,
          width: 106,
          child: Image.asset(
            "assets/f_logo.png",
            fit: BoxFit.fitWidth,
          ),
        )
      ],
    );
  }
}
