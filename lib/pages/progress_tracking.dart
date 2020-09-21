import 'package:app_shoe_shop/core/flutter_icons.dart';
import 'package:app_shoe_shop/widgets/custom_button.dart';
import 'package:flutter/material.dart';

class ProgressTrack extends StatefulWidget {
  List stages;
  String status;

  ProgressTrack({this.stages, this.status});
  @override
  _ProgressTrackState createState() => _ProgressTrackState();
}

class _ProgressTrackState extends State<ProgressTrack> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(FlutterIcons.left_open_1),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: ListView(
          children: [
            Text(
              "Progress",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 32,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            GridView.count(
                crossAxisCount:
                    MediaQuery.of(context).orientation == Orientation.landscape
                        ? 4
                        : 2,
                childAspectRatio: 0.7,
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                children: <Widget>[
                  buildCard(
                      '1. Order Placed',
                      widget.status,
                      widget.stages[0],
                      Stack(
                        children: <Widget>[
                          Positioned(
                              bottom: -32.5,
                              right: -32.5,
                              child: Container(
                                height: 65,
                                width: 65,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(50),
                                    color: Colors.white),
                              )),
                          Positioned(
                              bottom: -27.5,
                              right: -27.5,
                              child: Container(
                                height: 55,
                                width: 55,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(50),
                                    color: Colors.green),
                              )),
                          Positioned(
                              bottom: -25,
                              right: -25,
                              child: Container(
                                height: 50,
                                width: 50,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(50),
                                    color: Colors.white),
                              ))
                        ],
                      ),
                      BorderRadius.only(topLeft: Radius.circular(15))),
                  buildCard(
                      '2. Worker has Left',
                      widget.status,
                      widget.stages[1],
                      Stack(
                        children: <Widget>[
                          Positioned(
                              bottom: -32.5,
                              left: -32.5,
                              child: Container(
                                height: 65,
                                width: 65,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(50),
                                    color: Colors.white),
                              )),
                          Positioned(
                              bottom: -27.5,
                              left: -27.5,
                              child: Container(
                                height: 55,
                                width: 55,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(50),
                                    color: Colors.green),
                              )),
                          Positioned(
                              bottom: -25,
                              left: -25,
                              child: Container(
                                height: 50,
                                width: 50,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(50),
                                    color: Colors.white),
                              ))
                        ],
                      ),
                      BorderRadius.only(topRight: Radius.circular(15))),
                  buildCard(
                      '3. Working on Job',
                      widget.status,
                      widget.stages[2],
                      Stack(
                        children: <Widget>[
                          Positioned(
                              top: -32.5,
                              right: -32.5,
                              child: Container(
                                height: 65,
                                width: 65,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(50),
                                    color: Colors.white),
                              )),
                          Positioned(
                              top: -27.5,
                              right: -27.5,
                              child: Container(
                                height: 55,
                                width: 55,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(50),
                                    color: Colors.green),
                              )),
                          Positioned(
                              top: -25,
                              right: -25,
                              child: Container(
                                height: 50,
                                width: 50,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(50),
                                    color: Colors.white),
                              ))
                        ],
                      ),
                      BorderRadius.only(bottomLeft: Radius.circular(15))),
                  buildCard(
                      '4. Work Complete',
                      widget.status,
                      widget.stages[3],
                      Stack(
                        children: <Widget>[
                          Positioned(
                              top: -32.5,
                              left: -32.5,
                              child: Container(
                                height: 65,
                                width: 65,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(50),
                                    color: Colors.white),
                              )),
                          Positioned(
                              top: -27.5,
                              left: -27.5,
                              child: Container(
                                height: 55,
                                width: 55,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(50),
                                    color: Colors.green),
                              )),
                          Positioned(
                              top: -25,
                              left: -25,
                              child: Container(
                                height: 50,
                                width: 50,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(50),
                                    color: Colors.white),
                              ))
                        ],
                      ),
                      BorderRadius.only(bottomRight: Radius.circular(15))),
                ]),
            SizedBox(height: 20),
            widget.status == 'Active'
                ? Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25.0),
                    child: DefaultButton(
                      text: "Cancel Order",
                      press: () {},
                    ),
                  )
                : Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25.0),
                    child: DefaultButton(
                      text: 'Feedback',
                      press: () {},
                    ),
                  )
          ],
        ),
      ),
    );
  }

  Widget buildCard(String text, String status, bool stage, Widget positioned,
      BorderRadius br) {
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
              borderRadius: br,
              color: stage ? Colors.green : Colors.grey,
              boxShadow: [
                BoxShadow(
                  color: Colors.black12,
                  spreadRadius: 1,
                  blurRadius: 10,
                )
              ]),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  stage
                      ? Icons.done_outline
                      : status == 'Active' ? Icons.av_timer : Icons.cancel,
                  color: stage ? Colors.white : Colors.black,
                ),
                Text(
                  text,
                  style: TextStyle(
                      color: stage ? Colors.white : Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 8),
                Text(
                  stage
                      ? 'Complete'
                      : status == 'Active' ? 'Under Progress' : 'Cancelled',
                  style: TextStyle(color: stage ? Colors.white : Colors.black),
                ),
              ],
            ),
          ),
        ),
        stage ? positioned : Container()
      ],
    );
  }
}
