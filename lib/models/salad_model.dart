import 'package:flutter/material.dart';

class Salad {
  final String name;
  final double price;
  final String image;
  final Color? bgColor; // Optional property

  Salad({
    required this.name,
    required this.price,
    required this.image,
    this.bgColor, // Optional parameter
  });
}
