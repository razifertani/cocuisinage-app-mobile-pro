import 'package:auto_size_text/auto_size_text.dart';

import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../Theme/my_text_styles.dart';

class SimpleCalculator extends StatefulWidget {
  @override
  _SimpleCalculatorState createState() => _SimpleCalculatorState();
}

class _SimpleCalculatorState extends State<SimpleCalculator> {
  int currentTextIndex = 0;
  switchTextIndex(int index) {
    currentTextIndex = index;
    setState(() {});
  }

  String cbEquation = "";
  String espEquation = "";
  String result = "0";

  double equationFontSize = 25.0;
  double resultFontSize = 30.0;
  Color primaryButtonColor = const Color(0xFF505050);

  Color secondaryButtonColor = const Color(0xFFD4D4D2);
  buttonPressed(String buttonText) {
    setState(() {
      if (buttonText == "C") {
        switchTextIndex(0);
        cbEquation = "";
        espEquation = "";
        result = "0";

        equationFontSize = 25.0;
        resultFontSize = 30.0;
      } else if (buttonText == "=") {
        equationFontSize = 25.0;
        resultFontSize = 30.0;

        try {
          Parser p = Parser();
          Expression exp = p.parse(
              (double.parse(cbEquation.replaceAll("CB", '')) +
                      double.parse(espEquation.replaceAll("ESP", '')))
                  .toString());

          ContextModel cm = ContextModel();
          result = '${(exp).evaluate(EvaluationType.REAL, cm)}';
        } catch (e) {
          result = "Error";
        }
      } else if (buttonText == "CB") {
        switchTextIndex(0);
      } else if (buttonText == "ECP") {
        switchTextIndex(1);
      } else {
        equationFontSize = 30.0;
        resultFontSize = 25.0;
        if (currentTextIndex == 0) cbEquation += buttonText;
        if (currentTextIndex == 1) espEquation += buttonText;
      }
    });
  }

  Widget buildButton(String buttonText, double buttonHeight, Color buttonColor,
      Color textColor) {
    return Padding(
      padding: const EdgeInsets.all(6.0),
      child: InkWell(
        onTap: () => buttonPressed(buttonText),
        child: Container(
            height: 6.5.h,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              color: buttonColor,
            ),
            child: Center(
              child: Text(
                buttonText,
                style: MyTextStyles.subhead.copyWith(color: textColor),
              ),
            )),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Flexible(
          child: Container(
            alignment: Alignment.centerRight,
            padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
            child: AutoSizeText(
              "CB : $cbEquation",
              style: TextStyle(fontSize: equationFontSize),
            ),
          ),
        ),
        Flexible(
          child: Container(
            alignment: Alignment.centerRight,
            padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
            child: AutoSizeText(
              "ECP : $espEquation",
              style: TextStyle(fontSize: equationFontSize),
            ),
          ),
        ),
        Container(
          alignment: Alignment.centerRight,
          padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
          child: Text(
            result,
            style: TextStyle(fontSize: resultFontSize),
          ),
        ),
        SizedBox(
          height: 30,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              width: MediaQuery.of(context).size.width * .65,
              child: Table(
                children: [
                  TableRow(children: [
                    buildButton("7", 1, primaryButtonColor, Colors.white),
                    buildButton("8", 1, primaryButtonColor, Colors.white),
                    buildButton("9", 1, primaryButtonColor, Colors.white),
                  ]),
                  TableRow(children: [
                    buildButton("4", 1, primaryButtonColor, Colors.white),
                    buildButton("5", 1, primaryButtonColor, Colors.white),
                    buildButton("6", 1, primaryButtonColor, Colors.white),
                  ]),
                  TableRow(children: [
                    buildButton("1", 1, primaryButtonColor, Colors.white),
                    buildButton("2", 1, primaryButtonColor, Colors.white),
                    buildButton("3", 1, primaryButtonColor, Colors.white),
                  ]),
                  TableRow(children: [
                    buildButton(".", 1, primaryButtonColor, Colors.white),
                    buildButton("0", 1, primaryButtonColor, Colors.white),
                    buildButton("00", 1, primaryButtonColor, Colors.white),
                  ]),
                ],
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width * 0.25,
              child: Table(
                children: [
                  TableRow(children: [
                    buildButton("C", 1, secondaryButtonColor, Colors.black),
                  ]),
                  TableRow(children: [
                    buildButton("CB", 1, secondaryButtonColor, Colors.black),
                  ]),
                  TableRow(children: [
                    buildButton("ECP", 1, secondaryButtonColor, Colors.black),
                  ]),
                  TableRow(children: [
                    buildButton("=", 1, secondaryButtonColor, Colors.black),
                  ]),
                ],
              ),
            )
          ],
        ),
      ],
    );
  }
}
