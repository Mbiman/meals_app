import 'package:flutter/material.dart';

class Category {
  final String id;
  final String title;
  final Color color;
  final String imgName;

  const Category({
    required this.imgName,
    required this.id,
    required this.title,
    this.color = Colors.orange,
  });
}
