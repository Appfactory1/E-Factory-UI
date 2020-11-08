import 'package:app_shoe_shop/core/const.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';

class Rev {
  String rating;
  String review;

  Rev({this.rating, this.review});

  static List<Rev> reviews = [
    Rev(
      rating: '4',
      review:
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Pellentesque pharetra at ante ac dapibus. Nam et cursus lorem. In tempus mattis sapien vehicula commodo.",
    ),
    Rev(
      rating: '5',
      review:
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Pellentesque pharetra at ante ac dapibus. Nam et cursus lorem. In tempus mattis sapien vehicula commodo.",
    ),
    Rev(
        rating: '3',
        review:
            "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Pellentesque pharetra at ante ac dapibus. Nam et cursus lorem. In tempus mattis sapien vehicula commodo."),
  ];
}
