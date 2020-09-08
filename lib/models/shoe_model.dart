import 'package:app_shoe_shop/core/const.dart';
import 'package:flutter/material.dart';

class WorkerCard {
  String name;
  String occupation;
  double rating;
  String image;

  WorkerCard({
    this.name,
    this.occupation,
    this.rating,
    this.image,
  });

  static List<WorkerCard> list = [
    WorkerCard(
        name: 'Abdul Basit',
        occupation: 'AC Repairer',
        rating: 2.3456,
        image: 'im1.jpg'),
    WorkerCard(
        name: 'Abdullah Kazmi',
        occupation: 'Electrician',
        rating: 3.8987,
        image: 'im2.jpg'),
    WorkerCard(
        name: 'Zaid Bin Arif',
        occupation: 'Plumber',
        rating: 4.874,
        image: 'im3.jpg')
  ];
}
