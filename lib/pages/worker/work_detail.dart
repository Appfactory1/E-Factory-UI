import 'package:flutter/material.dart';

class Work_Detail extends StatefulWidget {
  @override
  _Work_DetailState createState() => _Work_DetailState();
}

class _Work_DetailState extends State<Work_Detail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF6F7FA),
      body: SafeArea(
        child: PageView(
          scrollDirection: Axis.vertical,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 8.0, bottom: 12.0),
                      child: CircleAvatar(
                        radius: 30,
                        backgroundColor: Colors.grey,
                      ),
                    ),
                  ),
                  Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Full Name",
                        style: TextStyle(
                            fontSize: 24, fontWeight: FontWeight.bold),
                      )),
                  Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: const EdgeInsets.only(top: 4.0),
                        child: Text(
                          "+92 333 1234567",
                          style: TextStyle(fontSize: 14, color: Colors.grey),
                        ),
                      )),
                  Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: const EdgeInsets.only(top: 12.0),
                        child: Text(
                          "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Pellentesque pharetra at ante ac dapibus. Nam et cursus lorem. In tempus mattis sapien vehicula commodo.",
                          style:
                              TextStyle(fontSize: 18, color: Colors.grey[600]),
                        ),
                      ))
                ],
              ),
            ),
            Column(
              children: <Widget>[],
            )
          ],
        ),
      ),
    );
  }

  Widget text(String text,
      {var fontSize = 16.0,
      textColor = const Color(0xFF38475B),
      var fontFamily = 'Regular',
      var isCentered = false,
      var maxLine = 1,
      var latterSpacing = 0.25,
      var textAllCaps = false,
      var isLongText = false}) {
    return Text(textAllCaps ? text.toUpperCase() : text,
        textAlign: isCentered ? TextAlign.center : TextAlign.start,
        maxLines: isLongText ? null : maxLine,
        style: TextStyle(
            fontFamily: fontFamily,
            fontSize: fontSize,
            color: textColor,
            height: 1.5,
            letterSpacing: latterSpacing));
  }

  Widget learnerOptionDescription(var total, var type) {
    return Container(
      margin: EdgeInsets.only(left: 16, right: 16),
      child: Column(
        children: <Widget>[
          SizedBox(
            height: 4,
          ),
          text(total, fontFamily: 'Medium', isLongText: true),
          text(type, textColor: Color(0xFF778390)),
        ],
      ),
    );
  }

  BoxDecoration boxDecoration(
      {double radius = 2,
      Color color = Colors.transparent,
      Color bgColor = Colors.white,
      var showShadow = false}) {
    return BoxDecoration(
        color: bgColor,
        //gradient: LinearGradient(colors: [bgColor, whiteColor]),
        boxShadow: showShadow
            ? [
                BoxShadow(
                    color: Color(0X95E9EBF0), blurRadius: 10, spreadRadius: 2)
              ]
            : [BoxShadow(color: Colors.transparent)],
        border: Border.all(color: color),
        borderRadius: BorderRadius.all(Radius.circular(radius)));
  }
}
