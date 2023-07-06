import 'package:calculadora/widgets/CalcButton.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:math_expressions/math_expressions.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String _history = "";
  String _expresion = "";
  void allClear(String text) {
    setState(() {
      _expresion = "";
    });
  }

  void clear(String text) {
    setState(() {
      _history = "";
      _expresion = "";
    });
  }

  void evaluate(String text) {
    Parser p = Parser();
    Expression exp = p.parse(_expresion);
    ContextModel cm = ContextModel();
    setState(() {
      _history = _expresion;
      _expresion = exp.evaluate(EvaluationType.REAL, cm).toString();
    });
  }

  void numClick(String text) {
    setState(() {
      _expresion += text;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Calculadora",
      home: Scaffold(
        backgroundColor: Color(0xff212528),
        body: Container(
          padding: EdgeInsets.all(12),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Container(
                alignment: Alignment(1.0, 1.0),
                child: Padding(
                  padding: EdgeInsets.only(right: 12),
                  child: Text(
                    _history,
                    style: GoogleFonts.rubik(
                        textStyle:
                            TextStyle(fontSize: 24, color: Color(0xff545f61))),
                  ),
                ),
              ),
              Container(
                alignment: Alignment(1.0, 1.0),
                child: Padding(
                  padding: EdgeInsets.all(12),
                  child: Text(
                    _expresion,
                    style: GoogleFonts.rubik(
                        textStyle:
                            TextStyle(fontSize: 48, color: Colors.white)),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  CalcButton(
                    bgcolor: 0xff00bf45,
                    text: "AC",
                    callback: allClear,
                    textSize: 20,
                  ),
                  CalcButton(
                    bgcolor: 0xffe3303a,
                    text: "C",
                    callback: clear,
                    textSize: 20,
                  ),
                  CalcButton(
                    text: "%",
                    callback: numClick,
                    textSize: 20,
                  ),
                  CalcButton(
                    text: "/",
                    callback: numClick,
                    textSize: 20,
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  CalcButton(
                    text: "7",
                    callback: numClick,
                    textSize: 20,
                  ),
                  CalcButton(
                    text: "8",
                    callback: numClick,
                    textSize: 20,
                  ),
                  CalcButton(
                    text: "9",
                    callback: numClick,
                    textSize: 20,
                  ),
                  CalcButton(
                    text: "*",
                    callback: numClick,
                    textSize: 20,
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  CalcButton(
                    text: "6",
                    callback: numClick,
                    textSize: 20,
                  ),
                  CalcButton(
                    text: "5",
                    callback: numClick,
                    textSize: 20,
                  ),
                  CalcButton(
                    text: "4",
                    callback: numClick,
                    textSize: 20,
                  ),
                  CalcButton(
                    text: "+",
                    callback: numClick,
                    textSize: 20,
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  CalcButton(
                    text: "3",
                    callback: numClick,
                    textSize: 20,
                  ),
                  CalcButton(
                    text: "2",
                    callback: numClick,
                    textSize: 20,
                  ),
                  CalcButton(
                    text: "1",
                    callback: numClick,
                    textSize: 20,
                  ),
                  CalcButton(
                    text: "-",
                    callback: numClick,
                    textSize: 20,
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  CalcButton(
                    text: ".",
                    callback: numClick,
                    textSize: 20,
                  ),
                  CalcButton(
                    text: "0",
                    callback: numClick,
                    textSize: 20,
                  ),
                  CalcButton(
                    text: "00",
                    callback: numClick,
                    textSize: 20,
                  ),
                  CalcButton(
                    text: "=",
                    callback: evaluate,
                    textSize: 20,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
