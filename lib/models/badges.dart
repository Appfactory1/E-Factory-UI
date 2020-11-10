import 'package:app_shoe_shop/core/const.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';

class SubCat {
  String name;
  Icon icon;

  SubCat({this.name, this.icon});

  static List<SubCat> badges = [
    SubCat(
      name: 'Verified',
      icon: Icon(Octicons.verified, color: Colors.green),
    ),
    SubCat(
        name: '100 jobs',
        icon: Icon(MaterialCommunityIcons.hard_hat, color: Color(0xFFC4C1B2))),
    SubCat(
        name: '50 - 5 Star Ratings',
        icon: Icon(Entypo.trophy, color: Color(0xFFE8C513))),
  ];
}
