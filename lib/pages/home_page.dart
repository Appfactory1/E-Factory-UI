import 'package:app_shoe_shop/core/const.dart';
import 'package:app_shoe_shop/core/flutter_icons.dart';
import 'package:app_shoe_shop/models/categories_model.dart';
import 'package:app_shoe_shop/models/shoe_model.dart';
import 'package:app_shoe_shop/pages/detail_page.dart';
import 'package:app_shoe_shop/widgets/app_clipper.dart';
import 'package:flutter/material.dart';
import './../functions/round.dart';
import 'dart:math' as math;

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<WorkerCard> workerList = WorkerCard.list;
  List<CategoriesCard> categoriesList = CategoriesCard.list;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: Icon(
          FlutterIcons.menu,
          color: Colors.black,
        ),
      ),
      body: ListView(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  "Categories",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 32,
                  ),
                ),
                // IconButton(
                //   icon: Icon(FlutterIcons.search, color: Colors.black26),
                //   onPressed: null,
                // ),
              ],
            ),
          ),
          Container(
            height: 300,
            margin: EdgeInsets.symmetric(vertical: 16),
            child: ListView.builder(
              itemCount: workerList.length,
              scrollDirection: Axis.horizontal,
              physics: BouncingScrollPhysics(),
              padding: EdgeInsets.symmetric(horizontal: 16),
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (_) => DetailPage(
                            categoriesList[index].category,
                            categoriesList[index].color,
                            categoriesList[index].image),
                      ),
                    );
                  },
                  child: Container(
                    width: 230,
                    margin: EdgeInsets.only(right: 16),
                    child: Stack(
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.only(top: 25),
                          child: _buildBackground(index, 230),
                        ),
                        Positioned(
                          bottom: 150,
                          right: 10,
                          child: Hero(
                            tag: "hero${categoriesList[index].image}",
                            child: Image(
                              width: 150,
                              height: 150,
                              image: AssetImage(
                                  "assets/${categoriesList[index].image}"),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
          SizedBox(height: 16),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  "ALL CATEGORIES",
                  style: TextStyle(
                    color: Colors.black54,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                // Text(
                //   "VIEW ALL",
                //   style: TextStyle(
                //     color: AppColors.greenColor,
                //     fontSize: 12,
                //   ),
                //),
              ],
            ),
          ),
          SizedBox(height: 24),
          ...workerList.map((data) {
            return GestureDetector(
              onTap: () {},
              child: Container(
                margin: EdgeInsets.only(left: 16, right: 16, bottom: 10),
                padding: EdgeInsets.symmetric(vertical: 15, horizontal: 15),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(
                    Radius.circular(25),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black12,
                      spreadRadius: 1,
                      blurRadius: 10,
                    ),
                  ],
                ),
                child: Row(
                  children: <Widget>[
                    ClipRRect(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(15),
                        bottomLeft: Radius.circular(15),
                      ),
                      child: Image(
                        image: AssetImage("assets/${data.image}"),
                        width: 80,
                        height: 80,
                        fit: BoxFit.cover,
                      ),
                    ),
                    SizedBox(width: 16),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Container(
                            width: MediaQuery.of(context).size.width * .4,
                            child: Text(
                              "${data.name}",
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          Text(
                            "${data.occupation}",
                            style: TextStyle(
                              color: Colors.black26,
                              height: 1.5,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      child: Text(
                        "rating: ${roundDouble(data.rating, 1)}",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          }),
        ],
      ),
      // bottomNavigationBar: Container(
      //   decoration: BoxDecoration(
      //     borderRadius: BorderRadius.only(
      //       topLeft: Radius.circular(30),
      //       topRight: Radius.circular(30),
      //     ),
      //     color: Colors.white,
      //     boxShadow: [
      //       BoxShadow(
      //         color: Colors.black12,
      //         spreadRadius: 1,
      //         blurRadius: 10,
      //       )
      //     ],
      //   ),
      //   child: BottomNavigationBar(
      //     selectedItemColor: AppColors.greenColor,
      //     unselectedItemColor: Colors.black26,
      //     currentIndex: 1,
      //     type: BottomNavigationBarType.fixed,
      //     showSelectedLabels: false,
      //     showUnselectedLabels: false,
      //     backgroundColor: Colors.transparent,
      //     elevation: 0,
      //     items: [
      //       BottomNavigationBarItem(
      //         icon: Padding(
      //           padding: const EdgeInsets.all(8.0),
      //           child: Icon(FlutterIcons.compass),
      //         ),
      //         title: Text("data"),
      //       ),
      //       BottomNavigationBarItem(
      //         icon: Icon(FlutterIcons.list),
      //         title: Text("data"),
      //       ),
      //       BottomNavigationBarItem(
      //         icon: Icon(FlutterIcons.bag),
      //         title: Text("data"),
      //       ),
      //       BottomNavigationBarItem(
      //         icon: Icon(FlutterIcons.person_outline),
      //         title: Text("data"),
      //       ),
      //     ],
      //   ),
      //),
    );
  }

  Widget _buildBackground(int index, double width) {
    return ClipPath(
      clipper: AppClipper(cornerSize: 25, diagonalHeight: 100),
      child: Container(
        color: categoriesList[index].color,
        width: width,
        child: Stack(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  // Padding(
                  //   padding: const EdgeInsets.only(top: 20),
                  //   child: Icon(
                  //     workerList[index].brand == "Nike"
                  //         ? FlutterIcons.nike
                  //         : FlutterIcons.converse,
                  //     size: 30,
                  //     color: Colors.white,
                  //   ),
                  // ),
                  Expanded(child: SizedBox()),
                  Container(
                    width: 125,
                    child: Text(
                      "${categoriesList[index].category}",
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                  ),
                  SizedBox(height: 8),
                  Container(
                    child: Text(
                      "${categoriesList[index].desc}",
                      style: TextStyle(
                        color: Colors.white,
                      ),
                      overflow: TextOverflow.fade,
                    ),
                  ),
                ],
              ),
            ),
            // Positioned(
            //   bottom: 0,
            //   right: 0,
            //   child: Container(
            //     width: 50,
            //     height: 50,
            //     decoration: BoxDecoration(
            //       color: AppColors.greenColor,
            //       borderRadius: BorderRadius.only(
            //         topLeft: Radius.circular(10),
            //       ),
            //     ),
            //     child: Center(
            //       child: Icon(
            //         FlutterIcons.add,
            //         color: Colors.white,
            //       ),
            //     ),
            //   ),
            // )
          ],
        ),
      ),
    );
  }
}
