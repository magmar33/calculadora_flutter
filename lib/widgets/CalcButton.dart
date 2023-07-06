import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CalcButton extends StatelessWidget {
  final Function callback;
  final String text;
  final double textSize;
  final int bgcolor;
  const CalcButton(
      {super.key,
      required this.callback,
      required this.text,
      this.textSize = 28,
      this.bgcolor=0xff212528
      });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      child: SizedBox(
        width: 65,
        height: 65,
        child: TextButton(
            onPressed: () => {callback(text)},
            style: TextButton.styleFrom(
                backgroundColor: Color(bgcolor),
                foregroundColor: Colors.white,
                padding: EdgeInsets.all(16),
                textStyle: TextStyle(fontSize: 20)),
            child: Text(
              text,
              style:
                  GoogleFonts.rubik(textStyle: TextStyle(fontSize: textSize)),
            )),
      ),
    );
  }
}
