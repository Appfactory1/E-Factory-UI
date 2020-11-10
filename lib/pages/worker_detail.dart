<<<<<<< HEAD
=======
import 'package:app_shoe_shop/models/badges.dart';
import 'package:app_shoe_shop/models/reciews.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';

class WorkerDetail extends StatefulWidget {
  @override
  _WorkerDetailState createState() => _WorkerDetailState();
}

class _WorkerDetailState extends State<WorkerDetail> {
  List _badges = SubCat.badges;
  List _reviews = Rev.reviews;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF6F7FA),
      body: SafeArea(
        child: DefaultTabController(
          length: 3,
          child: Scaffold(
            backgroundColor: Color(0xFFF6F7FA),
            appBar: PreferredSize(
              preferredSize: Size.fromHeight(120),
              child: Container(
                color: Colors.white,
                child: SafeArea(
                    child: Padding(
                  padding: const EdgeInsets.only(left: 8.0, right: 16.0),
                  child: Container(
                    color: Color(0xFFF6F7FA),
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
                          child: text("Detail",
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
                                  padding:
                                      const EdgeInsets.symmetric(horizontal: 8),
                                  child: Text(
                                    "Badges",
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
                                    "Full Detail",
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
                                    "Reviews",
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
              children: <Widget>[
                Padding(
                  //one
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ListView.builder(
                        shrinkWrap: true,
                        itemCount: _badges.length,
                        itemBuilder: (BuildContext ctxt, int index) {
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: GestureDetector(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => WorkerDetail()));
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                    color: Color(0xFF3F414F),
                                    borderRadius: BorderRadius.circular(10)),
                                child: Row(
                                  children: [
                                    Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 20),
                                        child: _badges[index].icon),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          right: 12, top: 8, bottom: 8),
                                      child: Container(
                                        width: 1,
                                        height: 60,
                                        decoration: BoxDecoration(
                                            color: Colors.grey,
                                            borderRadius:
                                                BorderRadius.circular(10)),
                                      ),
                                    ),
                                    Text(
                                      _badges[index].name,
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 10.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            FlatButton(
                              height: 60,
                              minWidth:
                                  MediaQuery.of(context).size.width * 0.45,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10)),
                              color: Colors.grey,
                              onPressed: () {},
                              child: Text(
                                "Back",
                                style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            FlatButton(
                              minWidth:
                                  MediaQuery.of(context).size.width * 0.45,
                              height: 60,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10)),
                              color: Colors.green,
                              onPressed: () {},
                              child: Text(
                                "Select",
                                style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                Padding(
                  //two
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  left: 8.0, bottom: 12.0),
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
                                  style: TextStyle(
                                      fontSize: 14, color: Colors.grey),
                                ),
                              )),
                          Align(
                              alignment: Alignment.centerLeft,
                              child: Padding(
                                padding: const EdgeInsets.only(top: 12.0),
                                child: Text(
                                  "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Pellentesque pharetra at ante ac dapibus. Nam et cursus lorem. In tempus mattis sapien vehicula commodo.",
                                  style: TextStyle(
                                      fontSize: 18, color: Colors.grey[600]),
                                ),
                              ))
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 10.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            FlatButton(
                              height: 60,
                              minWidth:
                                  MediaQuery.of(context).size.width * 0.45,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10)),
                              color: Colors.grey,
                              onPressed: () {},
                              child: Text(
                                "Back",
                                style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            FlatButton(
                              minWidth:
                                  MediaQuery.of(context).size.width * 0.45,
                              height: 60,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10)),
                              color: Colors.green,
                              onPressed: () {},
                              child: Text(
                                "Select",
                                style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                Padding(
                  //three
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ListView.builder(
                        shrinkWrap: true,
                        itemCount: _reviews.length,
                        itemBuilder: (BuildContext context, int index) {
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: [
                                Container(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 8, vertical: 8),
                                  decoration: BoxDecoration(
                                      boxShadow: [
                                        BoxShadow(
                                            color: Colors.black,
                                            blurRadius: 8,
                                            spreadRadius: -5)
                                      ],
                                      color: Color(0xFFF0FAFC),
                                      borderRadius: BorderRadius.circular(10)),
                                  child: Column(
                                    children: [
                                      Align(
                                        alignment: Alignment.centerLeft,
                                        child: Row(
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  right: 8.0, left: 4),
                                              child: Text(
                                                _reviews[index].rating,
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 20,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            ),
                                            Icon(AntDesign.star,
                                                color: Color(0xFFE8C513))
                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                        height: 6,
                                      ),
                                      Align(
                                        alignment: Alignment.centerLeft,
                                        child: Text(
                                          _reviews[index].review,
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 15),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 10.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            FlatButton(
                              height: 60,
                              minWidth:
                                  MediaQuery.of(context).size.width * 0.45,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10)),
                              color: Colors.grey,
                              onPressed: () {},
                              child: Text(
                                "Back",
                                style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            FlatButton(
                              minWidth:
                                  MediaQuery.of(context).size.width * 0.45,
                              height: 60,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10)),
                              color: Colors.green,
                              onPressed: () {},
                              child: Text(
                                "Select",
                                style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                )
                // GridView.builder(
                //   scrollDirection: Axis.vertical,
                //   itemCount: 0,
                //   padding: EdgeInsets.only(bottom: 50),
                //   shrinkWrap: true,
                //   itemBuilder: (context, index) {
                //     return LearnerCourses(
                //         mList1[index], index, LearnerDescription.tag);
                //   },
                //   gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                //     crossAxisCount: 2,
                //   ),
                // ),
                // GridView.builder(
                //   scrollDirection: Axis.vertical,
                //   itemCount: mList1.length,
                //   padding: EdgeInsets.only(bottom: 50),
                //   shrinkWrap: true,
                //   itemBuilder: (context, index) {
                //     return LearnerCourses(
                //         mList1[index], index, LearnerModrenMedicine.tag);
                //   },
                //   gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                //     crossAxisCount: 2,
                //   ),
                // ),
                // GridView.builder(
                //   scrollDirection: Axis.vertical,
                //   itemCount: mList1.length,
                //   padding: EdgeInsets.only(bottom: 50),
                //   shrinkWrap: true,
                //   itemBuilder: (context, index) {
                //     return LearnerCourses(
                //         mList1[index], index, LearnerDescription.tag);
                //   },
                //   gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                //     crossAxisCount: 2,
                //   ),
                // ),
              ],
            ),
          ),
        ),
      ),
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

// class LearnerCourses extends StatelessWidget {
//   LearnerCoursesModel model;
//   String tags;

//   LearnerCourses(LearnerCoursesModel model, int pos, String tags) {
//     this.model = model;
//     this.tags = tags;
//   }

//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: () {
//         launchNewScreen(context, tags);
//       },
//       child: Container(
//         alignment: Alignment.center,
//         color: learner_white,
//         child: Column(
//           children: <Widget>[
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: <Widget>[
//                 CachedNetworkImage(
//                   imageUrl: model.img,
//                   width: 50,
//                   height: 50,
//                   fit: BoxFit.fill,
//                 ).cornerRadiusWithClipRRect(25).paddingOnly(left: 16, top: 16),
//                 IconButton(
//                   icon: Icon(
//                     Icons.more_vert,
//                     color: learner_greyColor,
//                   ),
//                   onPressed: () {},
//                 ),
//               ],
//             ),
//             Column(
//               children: <Widget>[
//                 text(model.name,
//                         textColor: learner_textColorPrimary,
//                         fontSize: textSizeMedium,
//                         fontFamily: fontMedium,
//                         maxLine: 2)
//                     .paddingOnly(left: 16, right: 16, top: 16),
//                 Container(
//                   child: LinearProgressIndicator(
//                     value: 0.5,
//                     backgroundColor: textSecondaryColor.withOpacity(0.2),
//                     valueColor: AlwaysStoppedAnimation<Color>(
//                       learner_green,
//                     ),
//                   ).paddingOnly(top: 16, left: 16, right: 16),
//                 )
//               ],
//             )
//           ],
//         ),
//       )
//           .cornerRadiusWithClipRRect(10.0)
//           .withShadow(shadowColor: learner_ShadowColor)
//           .paddingOnly(top: 16, left: 16, right: 16),
//     );
//   }
// }
>>>>>>> parent of b69ff03... almost UI
