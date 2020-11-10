import 'package:app_shoe_shop/core/const.dart';
import 'package:flutter/material.dart';

class CategoriesCard {
  String category;
  Color color;
  String desc;
  String image;

  CategoriesCard({
    this.category,
    this.color,
    this.desc,
    this.image,
  });

  static List<CategoriesCard> list = [
    CategoriesCard(
        category: 'Plumber',
        color: AppColors.blueColor,
        desc:
            'Sed tempor elit et faucibus sagittis. Integer et mollis velit. Nunc vel elit facilisis, porttitor erat id, blandit dui. Sed posuere iaculis tempor. Etiam elementum turpis sapien, et rutrum ligula eleifend vitae',
        image: '1.png'),
    CategoriesCard(
        category: 'Electrician',
        color: AppColors.yellowColor,
        desc:
            'Sed tempor elit et faucibus sagittis. Integer et mollis velit. Nunc vel elit facilisis, porttitor erat id, blandit dui. Sed posuere iaculis tempor. Etiam elementum turpis sapien, et rutrum ligula eleifend vitae.',
        image: '2.png'),
    CategoriesCard(
        category: 'AC Repairer',
        color: AppColors.redColor,
        desc:
            'Sed tempor elit et faucibus sagittis. Integer et mollis velit. Nunc vel elit facilisis, porttitor erat id, blandit dui. Sed posuere iaculis tempor. Etiam elementum turpis sapien, et rutrum ligula eleifend vitae.',
        image: '3.png')
  ];
}
