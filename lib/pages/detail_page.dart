import 'package:app_shoe_shop/core/const.dart';
import 'package:app_shoe_shop/core/flutter_icons.dart';
import 'package:app_shoe_shop/models/categories_model.dart';
import 'package:app_shoe_shop/models/shoe_model.dart';
import 'package:app_shoe_shop/widgets/app_clipper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import './../functions/round.dart';
import 'dart:math' as math;

class DetailPage extends StatefulWidget {
  final String workers;
  final Color color;
  final String image;

  DetailPage(this.workers, this.color, this.image);

  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  List<WorkerCard> workerList = WorkerCard.list;
  List<CategoriesCard> categoriesList = CategoriesCard.list;
  List<WorkerCard> newworkers;

  @override
  Widget build(BuildContext context) {
    newworkers = workerList
        .where((worker) => worker.occupation == widget.workers)
        .toList();

    return Scaffold(
      backgroundColor: widget.color,
      appBar: AppBar(
        backgroundColor: widget.color,
        elevation: 0,
        title: Text("CATEGORIES"),
        leading: IconButton(
          icon: Icon(FlutterIcons.left_open_1),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Stack(
          children: <Widget>[
            Positioned(
              bottom: 0,
              child: Container(
                height: MediaQuery.of(context).size.height * .75,
                width: MediaQuery.of(context).size.width,
                child: ClipPath(
                  clipper: AppClipper(
                    cornerSize: 50,
                    diagonalHeight: 180,
                    roundedBottom: false,
                  ),
                  child: Container(
                    color: Colors.white,
                    padding: EdgeInsets.only(top: 180, left: 16, right: 16),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Container(
                            width: 300,
                            child: Text(
                              "${widget.workers}",
                              style: TextStyle(
                                fontSize: 32,
                              ),
                            ),
                          ),
                          SizedBox(height: 16),
                          ...newworkers.map((data) {
                            return GestureDetector(
                              onTap: () {},
                              child: Container(
                                margin: EdgeInsets.only(bottom: 10),
                                padding: EdgeInsets.symmetric(
                                    vertical: 15, horizontal: 15),
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
                                        image:
                                            AssetImage("assets/${data.image}"),
                                        width: 80,
                                        height: 80,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                    SizedBox(width: 16),
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: <Widget>[
                                          Container(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                .4,
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
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 12),
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
                          SizedBox(height: 24),
                        ]),
                  ),
                ),
              ),
            ),
            Positioned(
              top: 0,
              right: 10,
              child: Hero(
                tag: "hero${widget.image}",
                child: Image(
                  width: MediaQuery.of(context).size.width * .85,
                  image: AssetImage("assets/${widget.image}"),
                  height: 280,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Widget _buildBottom() {
  //   return Container(
  //     padding: EdgeInsets.symmetric(vertical: 16, horizontal: 32),
  //     width: MediaQuery.of(context).size.width,
  //     decoration: BoxDecoration(
  //       color: Colors.white,
  //       borderRadius: BorderRadius.only(
  //         topLeft: Radius.circular(30),
  //         topRight: Radius.circular(30),
  //       ),
  //       boxShadow: [
  //         BoxShadow(
  //           color: Colors.black12,
  //           spreadRadius: 1,
  //           blurRadius: 10,
  //         )
  //       ],
  //     ),
  //     child: Row(
  //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //       children: <Widget>[
  //         Column(
  //           mainAxisSize: MainAxisSize.min,
  //           crossAxisAlignment: CrossAxisAlignment.start,
  //           children: <Widget>[
  //             Text(
  //               "PRICE",
  //               style: TextStyle(
  //                 color: Colors.black26,
  //               ),
  //             ),
  //             Text(
  //               "\$${widget.shoeModel.price.toInt()}",
  //               style: TextStyle(
  //                 fontWeight: FontWeight.bold,
  //                 fontSize: 28,
  //               ),
  //             ),
  //           ],
  //         ),
  //         Container(
  //           padding: EdgeInsets.symmetric(
  //             vertical: 16,
  //             horizontal: 50,
  //           ),
  //           decoration: BoxDecoration(
  //             color: AppColors.greenColor,
  //             borderRadius: BorderRadius.all(
  //               Radius.circular(50),
  //             ),
  //           ),
  //           child: Text(
  //             "ADD CART",
  //             style: TextStyle(
  //               color: Colors.white,
  //             ),
  //           ),
  //         ),
  //       ],
  //     ),
  //   );
  // }

  // Widget _buildColorOption(Color color) {
  //   return Container(
  //     width: 20,
  //     height: 20,
  //     margin: EdgeInsets.only(right: 8),
  //     decoration: BoxDecoration(
  //       color: color,
  //       borderRadius: BorderRadius.all(
  //         Radius.circular(50),
  //       ),
  //     ),
  //   );
  // }

  // Widget _buildRating() {
  //   return Row(
  //     children: <Widget>[
  //       RatingBar(
  //         initialRating: 3,
  //         minRating: 1,
  //         direction: Axis.horizontal,
  //         allowHalfRating: true,
  //         itemCount: 5,
  //         itemSize: 20,
  //         itemPadding: EdgeInsets.symmetric(horizontal: 2.0),
  //         itemBuilder: (context, _) => Icon(
  //           Icons.star,
  //           color: Colors.amber,
  //         ),
  //         onRatingUpdate: (rating) {
  //           print(rating);
  //         },
  //       ),
  //       SizedBox(width: 16),
  //       Text(
  //         "134 Reviews",
  //         style: TextStyle(
  //           color: Colors.black26,
  //         ),
  //       )
  //     ],
  //   );
  // }
}
