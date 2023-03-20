import 'package:grocery/data/models/comment.dart';

class Product {
  final String name;
  final List<String> images;
  final String unit;
  final double price;
  final bool hasDiscount;
  final double discount;
  final String description;
  final double rating;
  final List<Comment> comments;
  Product({
    required this.name,
    required this.images,
    required this.unit,
    required this.price,
    required this.hasDiscount,
    required this.discount,
    required this.description,
    required this.comments,
    required this.rating,
  });
}
