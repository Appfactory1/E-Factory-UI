import 'package:app_shoe_shop/core/const.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';

class SubCat {
  String category;
  String price;
  Icon icon;

  SubCat({this.category, this.price, this.icon});

  static List<SubCat> subCatlist = [
    SubCat(
      category: 'Repair',
      price: "Variable Price",
      icon: Icon(
        Icons.home_repair_service,
        color: Colors.white,
      ),
    ),
    SubCat(
        category: 'Installation',
        price: "Rs. 700-850",
        icon: Icon(Entypo.install, color: Colors.white)),
    SubCat(
        category: 'Service',
        price: "Rs. 1000-1200",
        icon: Icon(Entypo.air, color: Colors.white)),
    SubCat(
        category: 'Other',
        price: "Variable Price",
        icon: Icon(AntDesign.ellipsis1, color: Colors.white))
  ];
}
