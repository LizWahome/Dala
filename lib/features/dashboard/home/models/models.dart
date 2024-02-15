import 'package:flutter/material.dart';

class SpecialMenu {
  final String image;
  final String text;
  SpecialMenu({required this.image, required this.text});
}
class Categories {
  final IconData icon;
  final String text;
  Categories({required this.icon, required this.text});
}

class Recommended {
  final String image;
  final String text;
  final String rate;
  final String distance;
  Recommended(
      {required this.image,
      required this.text,
      required this.rate,
      required this.distance});
}