import 'package:app_shoe_shop/models/work_details.dart';
import 'package:app_shoe_shop/pages/worker/work_detail.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';

class WorkerHome extends StatefulWidget {
  @override
  _WorkerHomeState createState() => _WorkerHomeState();
}

class _WorkerHomeState extends State<WorkerHome> {
  List workerData = WorkDetail.workerDetails;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF3F0D5),
      body: SafeArea(
        child: DefaultTabController(
          length: 3,
          child: Scaffold(
              backgroundColor: Color(0xFFFFFDDD),
              appBar: PreferredSize(
                preferredSize: Size.fromHeight(120),
                child: Container(
                  color: Colors.white,
                  child: SafeArea(
                      child: Padding(
                    padding: const EdgeInsets.only(left: 8.0, right: 16.0),
                    child: Container(
                      color: Color(0xFFFFFFFF),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          SizedBox(
                            height: 10.0,
                          ),
                          Container(
                            alignment: Alignment.centerLeft,
                            width: MediaQuery.of(context).size.width,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 16.0),
                            child: text("Work Detail",
                                fontSize: 30.0,
                                fontFamily: 'Bold',
                                textColor: Colors.black),
                          ),
                          SizedBox(
                            height: 16.0,
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width / 1.3,
                            child: TabBar(
                              labelPadding:
                                  EdgeInsets.only(left: 0.0, right: 0.0),
                              indicatorWeight: 4.0,
                              indicatorSize: TabBarIndicatorSize.label,
                              indicatorColor: Color(0xFF345FFB),
                              labelColor: Color(0xFF345FFB),
                              isScrollable: true,
                              unselectedLabelColor: Color(0xFF778390),
                              tabs: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Container(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 8),
                                    child: Text(
                                      "Ongoing",
                                      style: TextStyle(
                                          fontSize: 18.0, fontFamily: "Bold"),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(right: 8.0),
                                  child: Container(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      "Pending",
                                      style: TextStyle(
                                          fontSize: 18.0, fontFamily: "Bold"),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(right: 8.0),
                                  child: Container(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      "Completed",
                                      style: TextStyle(
                                          fontSize: 18.0, fontFamily: "Bold"),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  )),
                ),
              ),
              body: TabBarView(
                children: [
                  Workers_Work(workerData: workerData),
                  Workers_Work(workerData: workerData),
                  Workers_Work(workerData: workerData)
                ],
              )),
        ),
      ),
    );
  }
}

class Workers_Work extends StatelessWidget {
  const Workers_Work({
    Key key,
    @required this.workerData,
  }) : super(key: key);

  final List workerData;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: workerData.length,
      itemBuilder: (BuildContext cntxt, int index) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: GestureDetector(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => Work_Detail()));
            },
            child: Container(
              decoration: BoxDecoration(
                  color: Color(0xFF3F414F),
                  borderRadius: BorderRadius.circular(10)),
              child: Row(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: Align(
                      alignment: Alignment.center,
                      child: CircleAvatar(
                        radius: 30,
                        backgroundColor: Colors.grey,
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(right: 12, top: 8, bottom: 8),
                    child: Container(
                      width: 1,
                      height: 60,
                      decoration: BoxDecoration(
                          color: Colors.grey,
                          borderRadius: BorderRadius.circular(10)),
                    ),
                  ),
                  Column(
                    // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        workerData[index].name,
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        workerData[index].job,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

Widget text(String text,
    {var fontSize = 16,
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
